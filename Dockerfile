FROM garo/easy-xpra:alpine
MAINTAINER Nikolas Garofil "nikolas@garofil.be"

#Install chromium, everything is on 1 layer to shrink image size (e.g. cleaning the apt cache on a new layer is pretty useless because the layer before still contains this data)
RUN apk add --no-cache --update py3-cairo
RUN apk add --no-cache --update chromium

#Run chromium in xpra
ENTRYPOINT ["run_in_xpra", "chromium-browser", "--no-sandbox", "--ssl-key-log-file='/root/sslkeylogfile'"]
