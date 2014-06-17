FROM litaio/ruby

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

RUN apt-get install -y apt-transport-https ca-certificates

RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" >> /etc/apt/sources.list

RUN apt-get update -qq

RUN apt-get install -y passenger

RUN gem install rack daemon_controller sinatra --no-ri --no-rdoc

WORKDIR /app

EXPOSE 3000
VOLUME ["/app"]
