# DOCKER-VERSION 0.7.1

FROM pandrew/chef-client

MAINTAINER Paul Andrew Liljenberg “letters@paulnotcom.se”

RUN apt-get -y update

ADD . /chef

RUN cd /chef && /opt/chef/embedded/bin/berks install --path /chef/cookbooks

RUN chef-solo -c /chef/solo.rb -j /chef/solo.json

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["nginx"]