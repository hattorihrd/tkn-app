#!/bin/sh

echo "#####ssh connection setting started#####"
#copy pub_key to Node-app server.
docker exec node-app mkdir /root/.ssh
docker cp ./ssh-key/id_rsa.pub node-app:/root/.ssh/authorized_keys
docker exec node-app chmod 700 /root/.ssh
docker exec node-app chmod 600 /root/.ssh/authorized_keys
docker exec node-app chown -Rf root:root /root/.ssh
#copy pub_key to Ansible server.
docker exec ansible mkdir /root/.ssh
docker cp ./ssh-key/id_rsa ansible:/root/.ssh/
docker exec ansible chmod 700 /root/.ssh
docker exec ansible chmod 600 /root/.ssh/id_rsa
docker exec ansible chown -Rf root:root /root/.ssh
#ssh service restart
docker exec ansible service ssh stop
docker exec ansible service ssh start
docker exec node-app service ssh stop
docker exec node-app service ssh start

#Known host registing for first PubkeyAuthentication 
docker exec ansible sh /root/ssh_prelogin.sh

echo "#####ssh connection setting  have done#####"
