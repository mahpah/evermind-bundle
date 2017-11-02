FROM microsoft/aspnetcore:1.1

LABEL maintainer="mahpahh@gmail.com"
LABEL name="aspnet-postgres"

RUN echo "deb http://httpredir.debian.org/debian jessie-backports main non-free" | tee -a /etc/apt/sources.list
RUN echo "deb-src http://httpredir.debian.org/debian jessie-backports main non-free" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get install postgresql -y
