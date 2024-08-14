import sys
import json
import time

KEY = sys.argv[0]

class App:

    def __init__(self, sys):
        self.key = sys

    def run(self):
        for i in self.key:
            print(i)

class RuntimeLayer:

    def __init__(self):
        self.session = {"session_size":0, "log":{}}

    def alter_record(self, record):
        self.session["log"][time.strftime("%H:%M:%S")] = record
        print("["+record)


    def logfiledump(self):
        out = json.dumps(self.session)
        print(out)



if __name__=='__main__':
    Logger = RuntimeLayer()
    Logger.alter_record(sys.argv[1])
    try:


