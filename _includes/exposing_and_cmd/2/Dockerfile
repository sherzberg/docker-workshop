FROM stackbrew/ubuntu:14.04
RUN apt-get update
RUN apt-get install -y ruby-dev

EXPOSE 8000
CMD ruby -run -e httpd . -p 8000
