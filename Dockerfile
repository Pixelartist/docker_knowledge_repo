FROM debian:latest
MAINTAINER Manuel Mueller

#   ____  __.                    .__             .___
#  |    |/ _| ____   ______  _  _|  |   ____   __| _/ ____   ____
#  |      <  /    \ /  _ \ \/ \/ /  | _/ __ \ / __ | / ___\_/ __ \
#  |    |  \|   |  (  <_> )     /|  |_\  ___// /_/ |/ /_/  >  ___/
#  |____|__ \___|  /\____/ \/\_/ |____/\___  >____ |\___  / \___  >
#          \/    \/                        \/     \/_____/      \/
#

## server runs at port 7000

# get base
RUN apt-get update && apt-get upgrade -y

# get essentials
RUN apt-get -y install git nano python python-pip python-psycopg2 supervisor cron

# get the psychop2
RUN pip install psycopg2-binary

# get Knowledge
RUN pip install --upgrade "knowledge-repo[all]"

# get the knowledge_repo
WORKDIR /home
RUN git clone https://github.com/Pixelartist/knowledge_repo.git

# add supervisor
COPY knowledge_repo.conf /etc/supervisor/conf.d/

# cron the fetch
COPY crontab /etc/cron.d/knowledge_repo
RUN chmod 0644 /etc/cron.d/knowledge_repo
RUN service cron start

# Run services
COPY start.sh /
RUN chmod +x /start.sh
CMD /start.sh
