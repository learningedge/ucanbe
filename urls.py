from django.conf import settings
from django.conf.urls.defaults import *
from django.views.generic.base import TemplateView

from django.contrib import admin
admin.autodiscover()

#from pinax.apps.account.openid_consumer import PinaxConsumer


#handler500 = "pinax.views.server_error"


urlpatterns = patterns("",
    url(r"^$", TemplateView.as_view(template_name="homepage.html"),
                                    name="home"),
    url(r"^admin/association_tag/bulk/add/$", 
        "research.learnoffer.views.association_tag_bulk_add", 
        name="learnoffer_association_tag_bulk_add"),
    url(r"^admin/association_tag/bulk/delete/$", 
        "research.learnoffer.views.association_tag_bulk_delete", 
        name="learnoffer_association_tag_bulk_delete"),
    url(r"^admin/", include(admin.site.urls)),
    url(r"^tagger/", include("research.tagger.urls")),
    url(r'^accounts/login/$', 'django.contrib.auth.views.login'),
    url(r"^accounts/", include("registration.urls")),
)


if settings.SERVE_MEDIA:
    urlpatterns += patterns("",
        url(r"", include("staticfiles.urls")),
    )

if settings.DEBUG:
    urlpatterns += patterns('',
            (r'^static/(.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_URL}),
    )