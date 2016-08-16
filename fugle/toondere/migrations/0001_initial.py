# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2016-07-29 08:13
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(max_length=40)),
                ('value', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('text', models.TextField()),
                ('created_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('published_date', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Star',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('star', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('gender', models.CharField(max_length=5)),
                ('email', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=50)),
                ('primary', models.CharField(max_length=30)),
                ('profile', models.CharField(max_length=50)),
                ('message', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Webtoon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('author1', models.CharField(max_length=30)),
                ('author2', models.CharField(max_length=30, null=True)),
                ('genre1', models.CharField(max_length=20)),
                ('genre2', models.CharField(max_length=20, null=True)),
                ('genre3', models.CharField(max_length=20, null=True)),
                ('summary', models.TextField(null=True)),
                ('media', models.CharField(max_length=30, null=True)),
                ('publish', models.BooleanField()),
                ('age', models.CharField(max_length=30, null=True)),
                ('thumbnail', models.TextField(null=True)),
                ('href', models.TextField(null=True)),
            ],
        ),
        migrations.AddField(
            model_name='star',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='toondere.User'),
        ),
        migrations.AddField(
            model_name='star',
            name='webtoon',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='toondere.Webtoon'),
        ),
        migrations.AddField(
            model_name='post',
            name='author',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]