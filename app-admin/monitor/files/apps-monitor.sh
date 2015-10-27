#!/bin/bash 

initial_service_func () {
    SERVICE_TTL='31';
    COM_SMILART_SERVICE_TYPE=`docker inspect -f '{{index .Config.Labels "com.smilart.service.type"}}' $CONTAINER_ID`;
    COM_SMILART_SERVICE_ID=`docker inspect -f '{{index .Config.Labels "com.smilart.service.id"}}' $CONTAINER_ID`;
    COM_SMILART_SERVICE_PORT=`docker inspect -f '{{index .Config.Labels "com.smilart.service.port"}}' $CONTAINER_ID`;
    CONTAINER_NAME=`docker inspect -f '{{.Name}}' $CONTAINER_ID`;
    CONTAINER_IP=`docker inspect -f '{{index .NetworkSettings "IPAddress"}}' $CONTAINER_ID`;
    if [[ -n `etcdctl ls /skydns/local/smilartservices/$COM_SMILART_SERVICE_TYPE/$(hostname)  2>&1 | grep 'Key not found'` ]]; then
        echo "Creating domain smilartservices.local in etcd.";
        curl -s http://127.0.0.1:2379/v2/keys/skydns/local/smilartservices/$COM_SMILART_SERVICE_TYPE/$(hostname) -XPUT -d dir=true;
    fi;
    if [[ -n $COM_SMILART_SERVICE_ID ]];then
        echo "Creating dns-name for container key $CONTAINER_NAME .";
        etcdctl set --ttl $SERVICE_TTL /skydns/local/smilartservices/$COM_SMILART_SERVICE_TYPE/$(hostname)$CONTAINER_NAME '{"host":"'$CONTAINER_IP'","port":'$COM_SMILART_SERVICE_PORT'}';
        echo "Creating service for container key $CONTAINER_NAME .";
        etcdctl set --ttl $SERVICE_TTL /skydns/local/smilart/$(hostname)/$COM_SMILART_SERVICE_TYPE/$COM_SMILART_SERVICE_ID '{"host":"'$CONTAINER_IP'","group":"'$COM_SMILART_SERVICE_TYPE'"}';
    else
        echo "Creating dns-name for container key $CONTAINER_NAME .";
        etcdctl set --ttl $SERVICE_TTL /skydns/local/smilartservices/$COM_SMILART_SERVICE_TYPE/$(hostname)$CONTAINER_NAME '{"host":"'$(hostname).smilart.local'"}';
    fi;
}


if [[ -n "$@" ]];then
    CONTAINER_ID=`docker inspect -f '{{.Id}}' $@`;
    initial_service_func;
else
    for CONTAINER_ID in `docker ps -q -f label=com.smilart.service.type`; do
        initial_service_func;
    done;
fi;
