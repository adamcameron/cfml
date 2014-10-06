# callMe.py
import os
print("Working directory: {0}\n".format(os.getcwd()))
exec(open("inc.py").read())