FROM 					stakater/base
LABEL         authors="Rasheed Amir <rasheed@aurorasolutions.io>, Hazim <hazim_malik@hotmail.com>"

RUN 					apt-get update && \
    					apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    					apt-get clean && \
    					rm -rf /var/lib/apt/lists/*

RUN 					curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.1_amd64.deb
RUN 					dpkg -i filebeat_1.2.1_amd64.deb

COPY 					filebeat.yml /etc/filebeat/filebeat.yml

# Make daemon service dir for filebeat and place file
RUN           mkdir -p /etc/service/filebeat
ADD           start.sh /etc/service/filebeat/run

RUN 					apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*