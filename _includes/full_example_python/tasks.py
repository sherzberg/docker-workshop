import os

from redis import Redis
from rq import Queue, Worker, Connection

redis = Redis(os.environ['REDIS_PORT_6379_TCP_ADDR'], os.environ['REDIS_PORT_6379_TCP_PORT'])
q = Queue('default', connection=redis)

def calculate(a, b):
    result = a + b
    print("{} + {} = {}".format(a, b, result))
    return result

if __name__ == '__main__':
    with Connection(redis):
        worker = Worker(map(Queue, ['default']))
        worker.work()
