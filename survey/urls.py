from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views

urlpatterns = [ 
    path('questions/responses/', views.SubmitResponse.as_view()),
    path('questions/responses/certificates/<int:certificate_id>', views.CertificateDownloadView.as_view(), name='download_certificate'),
    path('questions/', views.get_survey_questions_xml, name='survey_questions_xml'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

