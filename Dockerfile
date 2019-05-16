FROM ubuntu:16.04
MAINTAINER MOKSHA
RUN apt-get update && apt-get -y install sudo && adduser --disabled-password --gecos '' docker && adduser docker sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
USER docker
CMD /bin/bash
RUN sudo apt-get install software-properties-common -y&& sudo apt-get install curl python-software-properties -y && sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo bash - && sudo  apt-get install nodejs -y && sudo add-apt-repository ppa:eugenesan/ppa && sudo apt-get install jq -y && sudo apt-get install awscli -y
COPY ./securityGroup.sh /
RUN sudo chmod 777 /securityGroup.sh
ENTRYPOINT ["/securityGroup.sh"]

