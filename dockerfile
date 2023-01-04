FROM arm64v8/ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum 
RUN apt-get install -y ethereum openssl curl gnupg supervisor


RUN mkdir -p /tmp/jwt/jwtsecret
RUN openssl rand -hex 32 | tr -d "\n" > "/tmp/jwt/jwtsecret/jwt.hex"

RUN mkdir -p consensus /var/log/supervisor
RUN curl https://raw.githubusercontent.com/prysmaticlabs/prysm/master/prysm.sh --output consensus/prysm.sh && chmod +x consensus/prysm.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /

CMD ["/usr/bin/supervisord"]
