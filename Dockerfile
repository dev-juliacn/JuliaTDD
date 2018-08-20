FROM julia:latest
RUN apt-get update -y
RUN apt-get install -y bzip2
WORKDIR /home/
