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
    title = models.CharField(max_length=100)
    author = models.CharField(max_length=100)
    genre = models.CharField(max_length=100)
    tags = models.CharField(max_length=100, null=True)
    summary = models.TextField(null=True)
    media = models.CharField(max_length=30)
    publish = models.BooleanField()
    adult = models.BooleanField()
    thumbnail_small = models.TextField(null=True)
    thumbnail_big = models.TextField(null=True)
    link = models.TextField(null=True)
    is_cartoon = models.BooleanField()


    def __str__(self):
        return '[id : ' + str(self.id) +', title : '+ self.title +', genre : '+ self.genre +']'

    def serialize(self, recommendStar=0):
        data = {
            'id': self.id,
            'title': self.title,
            'author': self.author,
            'genre': self.genre,
            'tags': self.tags,
            'summary': self.summary,
            'media': self.media,
            'publish': self.publish,
            'adult': self.adult,
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
    profile = models.CharField(max_length=200)
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

class UserLog(models.Model):
    webtoon = models.ForeignKey('Webtoon')
    time = models.TextField()
    user = models.ForeignKey('User')

    def __str__(self):
        return '[userId : ' + str(self.user.id) + ', webtoonId : ' + str(self.webtoon.id) +', time :' + str(self.time) + ']'

    def serialize(self):
        data = {
            'user' : self.user,
            'webtoon': self.webtoon,
            'time': self.time
        }
        return data

class DontseeWebtoon(models.Model):
    webtoon = models.ForeignKey('Webtoon')
    dontsee = models.BooleanField()
    user = models.ForeignKey('User')

    def __str__(self):
        return '[userId : ' + str(self.user.id) + ', webtoonId : ' + str(self.webtoon.id) +', dontsee :' + str(self.dontsee) + ']'

    def serialize(self):
        data = {
            'user' : self.user,
            'webtoon': self.webtoon,
            'dontsee': self.dontsee
        }
        return data

class Comment(models.Model):
    webtoon = models.ForeignKey('Webtoon')
    comment = models.TextField()
    user = models.ForeignKey('User')

    def __str__(self):
        return '[userId : ' + str(self.user.id) + ', webtoonId : ' + str(self.webtoon.id) +', comment :' + str(self.comment) + ']'

    def serialize(self):
        data = {
            'user' : self.user,
            'webtoon': self.webtoon,
            'comment': self.comment
        }
        return data

class Rank(models.Model):
    webtoon = models.ForeignKey('Webtoon')
    cnt = models.CharField(max_length=40)
    year = models.CharField(max_length=30)
    month = models.CharField(max_length=30)
    dayofweek = models.CharField(max_length=30)

    def __str__(self):
        return '[cnt : ' + str(self.cnt) + ', webtoonId : ' + str(self.webtoon.id) +', month :' + str(self.month) + ']'

    def serialize(self):
        data = {
            'year' : self.year,
            'webtoon': self.webtoon,
            'cnt': self.cnt,
            'month' : self.month,
            'dayofweek': self.dayofweek,
        }
        return data
