from django.db import models
from django.utils import timezone

class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title

class Webtoon(models.Model):
    title = models.CharField(max_length=50)
    author1 = models.CharField(max_length=30)
    author2 = models.CharField(max_length=30, null=True)
    genre1 = models.CharField(max_length=20)
    genre2 = models.CharField(max_length=20, null=True)
    genre3 = models.CharField(max_length=20, null=True)
    summary = models.TextField(null=True)
    media = models.CharField(max_length=30, null=True)
    publish = models.BooleanField()
    age = models.CharField(max_length=30, null=True)
    thumbnail_small = models.TextField(null=True)
    thumbnail_big = models.TextField(null=True)
    link = models.TextField(null=True)


    def __str__(self):
        return '[id : ' + str(self.id) +', title : '+ self.title +', genre1 : '+ self.genre1 +']'

    def serialize(self, recommendStar=0):
        data = {
            'id': self.id,
            'title': self.title,
            'author1': self.author1,
            'author2': self.author2,
            'genre1': self.genre1,
            'genre2': self.genre2,
            'genre3': self.genre3,
            'summary': self.summary,
            'media': self.media,
            'publish': self.publish,
            'age': self.age,
            'thumbnail_small': self.thumbnail_small,
            'thumbnail_big': self.thumbnail_big,
            'link': self.link,
            'recommendStar': recommendStar
        }
        return data

class User(models.Model):
    name = models.CharField(max_length=40)
    gender = models.CharField(max_length=5, null=True)
    email = models.CharField(max_length=50, null=True)
    password = models.CharField(max_length=50, null=True)
    primary = models.CharField(max_length=30)
    profile = models.CharField(max_length=50)
    message = models.TextField(null=True)

    def serialize(self):
        data = {
            'id' : self.id,
            'name' : self.name,
            'gender' : self.gender,
            'email' : self.email,
            'password' : self.password,
            'primary' : self.primary,
            'profile' : self.profile,
            'message' : self.message
        }
        return data

class Star(models.Model):
    webtoon = models.ForeignKey('Webtoon')
    star = models.IntegerField(null=True)
    user = models.ForeignKey('User')

    def __str__(self):
        return '[userId : ' + str(self.user.id) + ', webtoonId : ' + str(self.webtoon.id) +', star :' + str(self.star) + ']'

    def serialize(self):
        data = {
            'user' : self.user,
            'webtoon': self.webtoon,
            'star': self.star
        }
        return data

class LikeWebtoon(models.Model):
    webtoon = models.ForeignKey('Webtoon')
    like = models.BooleanField()
    user = models.ForeignKey('User')

    def __str__(self):
        return '[userId : ' + str(self.user.id) + ', webtoonId : ' + str(self.webtoon.id) +', like :' + str(self.like) + ']'

    def serialize(self):
        data = {
            'user' : self.user,
            'webtoon': self.webtoon,
            'like': self.like
        }
        return data

