from radiant.compiler import server
import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__)))
server.main("test_project", ip='localhost', port=5000)
