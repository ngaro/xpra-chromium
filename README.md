# xpra-chromium

This runs Chromium in Xpra so you can attach to it from different systems.

Xpra allows you to use the speed of X-forwarding (a bit faster even) and the detach/attach possibilities of VNC.

## Tags

* [latest](https://github.com/ngaro/xpra-chromium/blob/master/Dockerfile) uses Ubuntu as base
* [alpine](https://github.com/ngaro/xpra-chromium/blob/alpine/Dockerfile) uses Alpine as base

## XPRA Usage

To run Chromium on 'chroserver' listening for xpra-connections on tcp/12345 for clients that want to use it:

* Run the container:

`docker run -d -p 12345:10000 --device /dev/snd --name xprachro garo/xpra-chromium`

* Wait a couple of seconds for everything to start...

* You can now use xpra on a client to connect to it with: `xpra attach tcp:chroserver:12345`

* If you detach the xpra connection from the client chromium will continue to run.

* Closing Chromium will also stop the container. With `docker start xprachro` it will start again.

The environment variable `XPRA_PORT` is `10000` by default but can be changed to make xpra listen to another port.

## Wireshark https traffic sniffing

Chromium is running with the sslkeylogfile option, which means that you can use it to decrypt the https traffic
between the container and webservers. Include the option `-v /somewhere/on/your/host:/root/sslkeylogfile'.

After the container starts run wireshark and in the preferences set `/somewhere/on/your/host` as the
pre-master-secret log filename in Edit > Preferences > Protocols > SSL . All non-chromium traffic wil be
filtered out by only logging the traffic on the docker0 interface and filtering on `not host 172.17.0.1`
(Assuming 172.17.0.1 is the ip on your host of docker0)

## Development
Want to improve this (bugfixes, extra features, ...) ?

Fork this repository on GitHub instead of cloning it,
I and other users might be interested in your changes !
