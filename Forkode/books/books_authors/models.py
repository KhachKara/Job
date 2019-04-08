from django.db import models


class Author(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    birth_date = models.DateField()


class Book(models.Model):
    id = models.PositiveIntegerField(primary_key=True)
    title = models.CharField(max_length=255)
    author_id = models.ForeignKey(Author)
