FROM ubuntu:trusty

COPY _build/prod /root
EXPOSE 8080
EXPOSE 25
