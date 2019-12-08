#!/bin/bash
cp /etc/hosts /etc/hosts.$(date +%s)
for HOST in $(docker ps -q) #utorrent radarr sonarr jackett ombi tautulli
 do
 NAME=$(docker inspect -f {{.Name}} $HOST | tr '/' ' ')
  IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $HOST)
  OUTPUT="$IP $NAME.pknw1.co.uk $NAME"

  echo $OUTPUT
  sed -i -e 's/.*$NAME/"${OUTPUT}"/' /etc/hosts
done

