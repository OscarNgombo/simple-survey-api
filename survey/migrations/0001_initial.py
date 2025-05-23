# Generated by Django 5.2 on 2025-04-05 07:55

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Question',
            fields=[
                ('question_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('text', models.TextField()),
                ('type', models.CharField(max_length=50)),
                ('required', models.BooleanField()),
                ('description', models.TextField(blank=True, null=True)),
                ('multiple', models.BooleanField()),
                ('format', models.CharField(blank=True, max_length=50, null=True)),
                ('max_file_size', models.IntegerField(blank=True, null=True)),
                ('max_file_size_unit', models.CharField(blank=True, max_length=10, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Response',
            fields=[
                ('respondent_id', models.AutoField(primary_key=True, serialize=False)),
                ('date_responded', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Option',
            fields=[
                ('option_id', models.AutoField(primary_key=True, serialize=False)),
                ('value', models.CharField(max_length=255)),
                ('question_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='survey.question')),
            ],
        ),
        migrations.CreateModel(
            name='Certificate',
            fields=[
                ('certificate_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('file_path', models.CharField(max_length=255)),
                ('upload_date', models.DateTimeField(auto_now_add=True)),
                ('respondent_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='survey.response')),
            ],
        ),
        migrations.CreateModel(
            name='ResponseDetail',
            fields=[
                ('response_detail_id', models.AutoField(primary_key=True, serialize=False)),
                ('answer', models.TextField()),
                ('question_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='survey.question')),
                ('response_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='survey.response')),
            ],
        ),
    ]
