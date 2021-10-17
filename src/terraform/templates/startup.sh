#!/bin/bash

COMPOSE_FILE_URL="https://raw.githubusercontent.com/deepfence/ThreatMapper/master/deployment-scripts/docker-compose.yml"
COMPOSE_FILE="/opt/ThreatMapper/docker-compose.yml"


if ! dpkg -l | grep -q "docker-ce"
then
  sh -c "$(curl -sSL https://get.docker.com/)"
fi

if [[ -z $(which docker-compose) ]]
then
  curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
fi


if [[ ! -d "/opt/ThreatMapper" ]]
then
 mkdir -p /opt/ThreatMapper
fi

if [[ ! -f "$COMPOSE_FILE" || $(curl -s "$COMPOSE_FILE_URL" | sha256sum | cut -d" " -f1) != $(sha256sum /opt/ThreatMapper/docker-compose.yml | cut -d" " -f1) ]] 
then

 curl -s -o "$COMPOSE_FILE" "$COMPOSE_FILE_URL" 
 # fix for router not restarting
 sed -i '/container_name: deepfence-router.*/a \ \ \ \ environment:\n\ \ \ \ \ \ OPERATING_MODE: "docker"' "$COMPOSE_FILE"

fi


docker-compose -f $COMPOSE_FILE up -d 

