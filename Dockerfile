#
# Dockerfile to build SpongeForge
#

FROM java:8
MAINTAINER Tighe Kuykendall, http://github.com/TigheK

RUN mkdir /forge

ADD ./start_forge /start_forge
RUN chmod 775 /start_forge

ENV MINECRAFT_PORT 25566
ENV MINECRAFT_EULA true
ENV MINECRAFT_MAXHEAP 1024M

ENV FORGE_VERSION 1.10.2-12.18.1.2026
ENV FORGE_URL http://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar

ENV SPONGE_VERSION 1.10.2-2026-5.0.0-BETA-1632
ENV SPONGE_URL http://files.minecraftforge.net/maven/org/spongepowered/spongeforge/${SPONGE_VERSION}/spongeforge-${SPONGE_VERSION}.jar

ENV EXECUTABLE_JAR forge-${FORGE_VERSION}-universal.jar

RUN DEBIAN_FRONTEND=noninteractive

WORKDIR /forge
VOLUME ["/forge"]

EXPOSE ${MINECRAFT_PORT}
EXPOSE ${MINECRAFT_PORT}/udp

CMD [""]
ENTRYPOINT /start_forge
