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
RUN apt-get -y install git nano python3 python3-pip supervisor

# get Knowledge
RUN pip3 install --upgrade "knowledge-repo[all]"

# Run services
COPY start.sh /
RUN chmod +x /start.sh
CMD /start.sh
