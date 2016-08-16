from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^insert/$',views.post_insert, name='post_insert'),
    url(r'^webtoon/$', views.webtoon_list, name='webtoon_list'),
    url(r'^login/$', views.userLogin, name='userLogin'),
    url(r'^mystar/$', views.mystar, name='mystar'),
    url(r'^detail/$', views.detail, name='detail'),
    url(r'^recommend/$', views.recommend, name='recommend'),
    url(r'^like/$', views.like, name='like'),
    url(r'^mainPage/$', views.mainPage, name='mainPage'),
    url(r'^rankingAuthor/$', views.rankingAuthor, name='rankingAuthor')
    
]
