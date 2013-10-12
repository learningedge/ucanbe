
import os

PACKAGE_ROOT = os.path.abspath(os.path.dirname(__file__))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'ucb',               
        'USER': 'root',  
        'PASSWORD': 'imagine',
        'HOST': '127.0.0.1', 
        'PORT': '3306',
        },
    # 'another': {
    #     'ENGINE': 'django.db.backends.mysql',
    #     'NAME': 'world',               
    #     'USER': 'testazureuser',  
    #     'PASSWORD': 'testazure',
    #     'HOST': '127.0.0.1', 
    #     'PORT': '3306',
    #     }
    }



TEMPLATE_DIRS = [
        os.path.join(PACKAGE_ROOT, "templates"),
    ]
#TEST_CHARSET


#TEST_COLLATION

SERVE_MEDIA  = False
AMAZON_KEY = "ABCD" 

AMAZON_SECRET  = "ABCD"

AMAZON_ASSOC_ID = "ABCD"





# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
STATIC_ROOT = "/home/watt/Downloads/Projects/Python/UCanBe/ucb/static"

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'

# URL prefix for admin static files -- CSS, JavaScript and images.
# Make sure to use a trailing slash.
# Examples: "http://foo.com/static/admin/", "/static/admin/".
ADMIN_MEDIA_PREFIX = '/static/admin/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    "/home/watt/Downloads/Projects/Python/UCanBe/ucb/",
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = '8ctbb*nr*+6rbkm7xtlg&dsrfuw*+=co+!yvq#92)wi81yo%*1'


TEMPLATE_CONTEXT_PROCESSORS = ( 
    'django.core.context_processors.debug', 
    'django.core.context_processors.i18n', 
    'django.core.context_processors.media', 
    'django.core.context_processors.static', 
    'django.contrib.auth.context_processors.auth', 
    'django.contrib.messages.context_processors.messages', 
) 

