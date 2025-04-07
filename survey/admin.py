from django.contrib import admin
from .models import Question, Option, Response, ResponseDetail, Certificate

class OptionInline(admin.TabularInline):  #  Or admin.StackedInline for a different layout
    model = Option
    extra = 3  #  Number of empty option forms to display

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('name', 'text', 'type', 'required')
    list_filter = ('type', 'required')
    search_fields = ('text', 'name')
    ordering = ('name',)
    inlines = [OptionInline]  #  Add the inline options

admin.site.register(Question, QuestionAdmin)
admin.site.register(Option)
admin.site.register(Response)
admin.site.register(ResponseDetail)
admin.site.register(Certificate)