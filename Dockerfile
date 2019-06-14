FROM garo/easy-xpra:latest
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

#Install chromium, everything is on 1 layer to shrink image size (e.g. cleaning the apt cache on a new layer is pretty useless because the layer before still contains this data)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install chromium-browser && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && touch /root/sslkeylogfile

#Run chromium in xpra
ENTRYPOINT ["run_in_xpra", "chromium-browser", "--no-sandbox", "--ssl-key-log-file='/root/sslkeylogfile'"]
