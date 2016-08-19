from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^webtoonEvaluate/$', views.webtoon_evaluate, name='webtoon_evaluate'),
    url(r'^cartoonEvaluate/$', views.cartoon_evaluate, name='cartoon_evaluate'),
    url(r'^insert/$',views.star_insert, name='star_insert'),
    # url(r'^webtoon/$', views.webtoon_list, name='webtoon_list'),

    url(r'^login/$', views.userLogin, name='userLogin'),
    url(r'^myWebtoonStar/$', views.my_webtoon_star, name='my_webtoon_star'),
    url(r'^myCartoonStar/$', views.my_cartoon_star, name='my_cartoon_star'),
    url(r'^detail/$', views.detail, name='detail'),
    url(r'^recommend/$', views.recommend, name='recommend'),
    url(r'^like/$', views.like, name='like'),
    url(r'^mylike/$', views.mylike, name='mylike'),
    url(r'^mainPage/$', views.mainPage, name='mainPage'),
    url(r'^searchName/$', views.searchName, name='searchName'),
    url(r'^search/$', views.search, name='search'),
    url(r'^emailRegi/$', views.emailRegi, name='emailRegi'),
    url(r'^emailLogin/$', views.emailLogin, name='emailLogin'),
    url(r'^userLog/$', views.userLog, name='userLog'),
    url(r'^dontsee/$', views.dontsee, name='dontsee'),
    url(r'^mydontsee/$', views.mydontsee, name='mydontsee'),
    url(r'^authorRank/$', views.author_rank, name='author_rank'),
    url(r'^comment/$', views.wirte_comment, name='wirte_comment'),
    url(r'^getComment/$', views.get_comment, name='get_comment'),
    url(r'^countOfWebtoonRank/$', views.count_of_webtoon_rank, name='count_of_webtoon_rank'),
    url(r'^scoreOfWebtoonRank/$', views.score_of_webtoon_rank, name='score_of_webtoon_rank'),
    url(r'^countOfCartoonRank/$', views.count_of_cartoon_rank, name='count_of_cartoon_rank'),
    url(r'^scoreOfCartoonRank/$', views.score_of_cartoon_rank, name='score_of_cartoon_rank'),
    url(r'^userTaste/$', views.userTaste, name='userTaste'),
    url(r'^searchAuthorName/$', views.search_author_name, name='search_author_name'),
    url(r'^searchTagName/$', views.search_tag_name, name='search_tag_name'),
    url(r'^webtoonLike/$', views.webtoon_like, name='webtoon_like'),
    url(r'^cartoonLike/$', views.cartoon_like, name='cartoon_like'),
    url(r'^webtoonLog/$', views.webtoon_log, name='webtoon_log'),
    url(r'^cartoonLog/$', views.cartoon_log, name='cartoon_log')

]
