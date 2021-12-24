#!/bin/bash
local_path=$(pwd)

docker run -it -p 25565:25565 \
-v "$local_path"/data/plugins:/spigot/plugins \
-v "$local_path"/data/world:/spigot/world \
-v "$local_path"/data/world_the_end:/spigot/world_the_end \
-v "$local_path"/data/world_nether:/spigot/world_nether \
-v "$local_path"/data/server.properties:/spigot/server.properties \
-v "$local_path"/data/ops.json:/spigot/ops.json \
-v "$local_path"/data/bukkit.yml:/spigot/bukkit.yml \
-v "$local_path"/data/spigot.yml:/spigot/spigot.yml \
-v "$local_path"/data/paper.yml:/spigot/paper.yml \
-v "$local_path"/data/whitelist.json:/spigot/whitelist.json \
-v "$local_path"/data/banned-players.json:/spigot/banned-players.json \
-v "$local_path"/data/banned-ips.json:/spigot/banned-ips.json \
-v "$local_path"/data/permissions.yml:/spigot/permissions.yml \
-d --name spigot spigot
