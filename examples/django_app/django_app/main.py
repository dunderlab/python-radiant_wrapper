""" Start Django in multithreaded mode

It allows for debugging Django while serving multiple requests at once in
multi-threaded mode.
"""

from radiant.compiler import server

import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), "test_project"))


server.main(ip='localhost', port=5000)

