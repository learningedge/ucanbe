#!/usr/bin/env python
import sys
#import deps


try:
    import pinax
except ImportError:
    sys.stderr.write("Error: Can't import Pinax. Make sure you are in a "
        "virtual environment that has\nPinax installed.\n")
    sys.exit(1)
else:
    import pinax.env


#try:
#    import projectname.settings
#except ImportError:
#    import sys
#    sys.stderr.write("Error: Can't find the file 'settings.py' in the directory containing %r. It appears you've customized things.\nYou'll have to run django-admin.py, passing it your settings module.\n(If the file settings.py does indeed exist, it's causing an ImportError somehow.)\n" % __file__)
#    sys.exit(1)


#if len(sys.argv) > 1 and sys.argv[1] == 'up':
#    deps.add_all_to_path(projectname.settings, auto_update=True)
#else:
#    deps.add_all_to_path(projectname.settings, auto_update=False)



from django.core.management import execute_from_command_line


pinax.env.setup_environ(__file__)


if __name__ == "__main__":
    execute_from_command_line()
