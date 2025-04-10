from rest_framework.views import APIView
from rest_framework.response import Response as DRFResponse
from rest_framework import status
from django.http import HttpResponse, FileResponse
from django.db.models import Prefetch
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.conf import settings
import os
import xml.etree.ElementTree as ET
from xml.dom import minidom
from rest_framework.parsers import MultiPartParser, FormParser
from .models import Question, Response, ResponseDetail, Certificate, Option


def save_uploaded_files(files, response):
    """Save uploaded files and create Certificate objects."""
    for file in files:
        file_path = os.path.join(settings.MEDIA_ROOT, file.name)
        with open(file_path, 'wb+') as destination:
            for chunk in file.chunks():
                destination.write(chunk)
        Certificate.objects.create(
            respondent_id=response,
            name=file.name,
            file_path=file_path,
        )


def build_xml_response(root_element):
    """Convert an XML element to a pretty-printed XML string."""
    rough_string = ET.tostring(root_element, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    return reparsed.toprettyxml(indent="  ")


class SubmitResponse(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def put(self, request, *args, **kwargs):
        response = Response.objects.create()

        for question_name, answer in request.data.items():
            if question_name == 'certificates':
                continue
            try:
                question = Question.objects.get(name=question_name)
                if question.type == "choice" and question.multiple:
                    for ans in answer.split(','):
                        ResponseDetail.objects.create(
                            response_id=response,
                            question_id=question,
                            answer=ans.strip()
                        )
                else:
                    ResponseDetail.objects.create(
                        response_id=response,
                        question_id=question,
                        answer=answer
                    )
            except Question.DoesNotExist:
                continue

        save_uploaded_files(request.FILES.getlist('certificates'), response)

        root = ET.Element("question_response")
        for detail in ResponseDetail.objects.filter(response_id=response):
            ET.SubElement(root, detail.question_id.name).text = detail.answer

        certificates_element = ET.SubElement(root, "certificates")
        for certificate in Certificate.objects.filter(respondent_id=response):
            certificate_element = ET.SubElement(certificates_element, "certificate")
            certificate_element.set("id", str(certificate.certificate_id))
            certificate_element.text = certificate.name

        ET.SubElement(root, "date_responded").text = response.date_responded.strftime("%Y-%m-%d %H:%M:%S")

        return HttpResponse(build_xml_response(root), content_type="application/xml")
    
    def get(self, request, *args, **kwargs):
        email_address = request.query_params.get('email_address')
        responses = Response.objects.filter(
            respondent_id__in=ResponseDetail.objects.filter(
                question_id__name='email_address', answer__icontains=email_address
            ).values_list('response_id', flat=True)
        ) if email_address else Response.objects.all()

        page_size = int(request.query_params.get('page_size', 10))
        page_number = request.query_params.get('page', 1)
        paginator = Paginator(responses, page_size)

        try:
            current_page_responses = paginator.page(page_number)
        except (PageNotAnInteger, EmptyPage):
            current_page_responses = paginator.page(1)

        root = ET.Element("question_responses", {
            "current_page": str(current_page_responses.number),
            "last_page": str(paginator.num_pages),
            "page_size": str(page_size),
            "total_count": str(paginator.count)
        })

        for response in current_page_responses:
            response_element = ET.SubElement(root, "question_response")
            ET.SubElement(response_element, "response_id").text = str(response.respondent_id)

            for detail in ResponseDetail.objects.filter(response_id=response):
                ET.SubElement(response_element, detail.question_id.name).text = detail.answer

            certificates_element = ET.SubElement(response_element, "certificates")
            for certificate in Certificate.objects.filter(respondent_id=response):
                ET.SubElement(certificates_element, "certificate", {
                    "id": str(certificate.certificate_id)
                }).text = certificate.name

            ET.SubElement(response_element, "date_responded").text = response.date_responded.strftime("%Y-%m-%d %H:%M:%S")

        return HttpResponse(build_xml_response(root), content_type="application/xml")


class CertificateDownloadView(APIView):
    def get(self, request, certificate_id):
        try:
            certificate = Certificate.objects.get(certificate_id=certificate_id)
            file_path = certificate.file_path
            if os.path.exists(file_path):
                response = FileResponse(open(file_path, 'rb'))
                response['Content-Disposition'] = f'attachment; filename="{certificate.name}"'
                return response
            else:
                return DRFResponse({"error": "File not found on server"}, status=status.HTTP_404_NOT_FOUND)
        except Certificate.DoesNotExist:
            return DRFResponse({"error": "Certificate not found"}, status=status.HTTP_404_NOT_FOUND)


def get_survey_questions_xml(request):
    questions = Question.objects.prefetch_related(
        Prefetch('option_set', queryset=Option.objects.all(), to_attr='options')
    ).all()

    root = ET.Element("questions")
    for question in questions:
        question_element = ET.SubElement(root, "question", {
            "name": question.name,
            "type": question.type,
            "required": "yes" if question.required else "no"
        })
        ET.SubElement(question_element, "text").text = question.text
        ET.SubElement(question_element, "description").text = question.description or ""

        if question.type == "choice":
            options_element = ET.SubElement(question_element, "options", {
                "multiple": "yes" if question.multiple else "no"
            })
            for option in question.options:
                ET.SubElement(options_element, "option", {"value": option.value}).text = option.value

        elif question.type == "file":
            ET.SubElement(question_element, "file_properties", {
                "format": question.format or "",
                "max_file_size": str(question.max_file_size or ""),
                "max_file_size_unit": question.max_file_size_unit or "",
                "multiple": "yes" if question.multiple else "no"
            })

    return HttpResponse(build_xml_response(root), content_type="application/xml")
