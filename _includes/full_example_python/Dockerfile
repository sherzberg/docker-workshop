FROM sherzberg/python-all-dev

RUN apt-get update -qq && apt-get install -y python-pip

RUN pip install flask rq

WORKDIR /app

EXPOSE 5000
VOLUME ["/app"]
