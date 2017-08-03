import os
import time
import fire
import json

class   run(object):

    def __init__(self):
        with open('roborun.json') as data_file:
            self.runJson = json.load(data_file)

    def test(self, option = "test"):
        print("\n" + self.runJson['script'][option] + "\n")

        t = time.time()
        os.system(self.runJson['script'][option])
        elapsed = time.time() - t
        
        print("\nDone " + str(elapsed) + " s.\n")

if __name__ == '__main__':
    fire.Fire(run)
