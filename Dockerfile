FROM garo/easy-xpra:ubuntu
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

#Install chromium, everything is on 1 layer to shrink image size (e.g. cleaning the apt cache on a new layer is pretty useless because the layer before still contains this data)
RUN apt-get update && apt-get -y install chromium-browser && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Run chromium in xpra
ENTRYPOINT ["run_in_xpra", "chromium-browser", "--no-sandbox", "--ssl-key-log-file='/root/sslkeylogfile'"]
