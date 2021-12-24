#!/bin/bash
local_path=$(pwd)

sudo groupadd spigot -g 3011
sudo useradd spigot -u 3011 -g 3011 -ms /bin/bash
sudo chown spigot:spigot -R "$local_path"/data/

mkdir data
mkdir data/world
mkdir data/world_the_end
mkdir data/world_nether
mkdir data/plugins

touch data/banned-ips.json
touch data/banned-players.json
touch data/ops.json
touch data/usercache.json
touch data/whitelist.json
touch data/server.properties
touch data/bukkit.yml
touch data/spigot.yml
touch data/paper.yml

echo "[]" > data/banned-ips.json
echo "[]" > data/banned-players.json
echo "[]" > data/ops.json
echo "[]" > data/usercache.json
echo "[]" > data/whitelist.json

echo "enable-rcon=true" >> data/server.properties
echo "rcon.port=25575" >> data/server.properties
echo "rcon.password=ChangeMe!" >> data/server.properties

docker build ./ -t spigot

sudo chown spigot:spigot -R "$local_path"/data/

