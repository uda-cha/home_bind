FROM ubuntu:focal-20201008

RUN apt-get update -q && apt-get upgrade -y \
 && apt-get install -y \
      bind9 \
      bind9utils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY named.conf /etc/bind/named.conf
COPY named.conf.home-zones /etc/bind/named.conf.home-zones
COPY uda-cha.net.zone /etc/bind/uda-cha.net.zone
COPY 100.168.192.rev /etc/bind/100.168.192.rev

USER bind:bind
EXPOSE 53
EXPOSE 53/udp
CMD ["/usr/sbin/named", "-f"]
