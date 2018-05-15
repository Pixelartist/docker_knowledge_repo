FROM debian:latest
MAINTAINER Manuel Mueller

# get base
RUN apt-get update && apt-get upgrade -y

# get essentials
RUN apt-get -y install git nano python3 python3-pip

# get Knowledge
RUN pip3 install --upgrade "knowledge-repo[all]"

# Run services
COPY start.sh /
RUN chmod +x /start.sh
CMD /start.sh
