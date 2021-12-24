# Minecraft Server based on Docker and Paper

## Features

* easy to deploy - build and run, that's all :)
* persistant data can be easily backuped
* includes mcrcon (https://github.com/Tiiffi/mcrcon)
* runs not as root
* is not log4j vulnerable ;)

## Configure (optional)

### dedicated user
A dedicated "spigot" user will be used (uid & guid: 3011). Adapt in *initial_docker_build.sh* and in *Dockerfile* if you want. 

### mcrcon
mcrcon will be installed but will NOT be accessible outside of the container per default. Add *-p 25575:25575* to *docker_run.sh* if you want it to be accessible outside of the container.
Also consider changing the password of mcrcon before you build the container in *initial_docker_build.sh* or afterwards in *data/server.properties*. 

## How to start
To build the image call *initial_docker_build.sh*. CAUTION: This script is meant to be called only the first time for initializing the filestructure as well as build the container.

```
sudo ./initial_docker_build.sh
```

After that the container can be started for the first time:

```
sudo ./docker_run.sh
```

## Read the logs
To get a live view of the console:

```
sudo docker logs -f spigot
```

## Enter the console
```
docker exec -it spigot /spigot/mcrcon/mcrcon -p "ChangeMe!" -t
```
if you change the password of mcrcon, adapt accordingly. 
