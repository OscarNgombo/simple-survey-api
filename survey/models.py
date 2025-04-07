from django.db import models

class Question(models.Model):
    question_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    text = models.TextField()
    type = models.CharField(max_length=50)
    required = models.BooleanField()
    description = models.TextField(blank=True, null=True)
    multiple = models.BooleanField()
    format = models.CharField(max_length=50, blank=True, null=True)
    max_file_size = models.IntegerField(blank=True, null=True)
    max_file_size_unit = models.CharField(max_length=10, blank=True, null=True)

    def __str__(self):
        return self.name

class Option(models.Model):
    option_id = models.AutoField(primary_key=True)
    question_id = models.ForeignKey(Question, on_delete=models.CASCADE)
    value = models.CharField(max_length=255)

    def __str__(self):
        return self.value

class Response(models.Model):
    respondent_id = models.AutoField(primary_key=True)  # Or rename to response_id for consistency
    date_responded = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Response {self.respondent_id}"  # Or response_id

class ResponseDetail(models.Model):
    response_detail_id = models.AutoField(primary_key=True)
    response_id = models.ForeignKey(Response, on_delete=models.CASCADE)
    question_id = models.ForeignKey(Question, on_delete=models.CASCADE)
    answer = models.TextField()

    def __str__(self):
        return f"ResponseDetail {self.response_detail_id}"

class Certificate(models.Model):
    certificate_id = models.AutoField(primary_key=True)
    respondent_id = models.ForeignKey(Response, on_delete=models.CASCADE) # Or response_id
    name = models.CharField(max_length=255)
    file_path = models.CharField(max_length=255)
    upload_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name