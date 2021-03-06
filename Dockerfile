FROM openjdk:17.0.2-slim

WORKDIR /spigot

RUN apt update; exit 0
RUN apt -y install git
RUN apt -y install build-essential
RUN apt -y install wget

# Accept Mojang EULA
RUN echo "eula=TRUE" > eula.txt

# Download RCon Client
RUN git clone https://github.com/Tiiffi/mcrcon.git
RUN cd mcrcon && make && make install

RUN groupadd spigot -g 3011
RUN useradd spigot -u 3011 -g 3011 -ms /bin/bash

RUN chown spigot:spigot /spigot
USER spigot

#RUN echo "[]" > banned-ips.json
#RUN echo "[]" > banned-players.json
#RUN echo "[]" > ops.json
#RUN echo "[]" > usercache.json
#RUN echo "[]" > whitelist.json

RUN touch server.properties

# Download Paper
RUN wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/379/downloads/paper-1.18.2-379.jar

# Open port for Minecraft
EXPOSE 25565
# Open port for mcrcon
EXPOSE 25575

# Run Spigot server
CMD java -Xmx2048M -Xms1024M -jar /spigot/paper.jar

