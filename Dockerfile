FROM debian:buster-slim

RUN apt-get update \
 && apt-get install -y \
      dnsmasq \
      dnsutils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY dnsmasq.resolv.conf /etc/dnsmasq.resolv.conf
COPY hosts-dnsmasq /etc/hosts-dnsmasq

USER root
EXPOSE 53 53/udp
CMD ["dnsmasq", "--no-daemon"]
