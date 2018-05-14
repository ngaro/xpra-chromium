# xpra-chromium

This runs Chromium in Xpra so you can attach to it from different systems.

Xpra allows you to use the speed of X-forwarding (a bit faster even) and the detach/attach possibilities of VNC.

## XPRA Usage

To run Chromium on 'chroserver' listening for xpra-connections on tcp/12345 for clients that want to use it:

* Run the container : `docker run -d -p 12345:10000 --name xprachro garo/xpra-chromium`

* Wait a couple of seconds for everything to start...

* You can now use xpra on a client to connect to it with: `xpra attach tcp:chroserver:12345`

* If you detach the xpra connection from the client chromium will continue to run.

* Closing Chromium will also stop the container. With `docker start xprachro` it will start again.

The environment variable `XPRA_PORT` is `10000` by default but can be changed to make xpra listen to another port.

## Regular (local) usage

You can also use this to run chromium locally in a container:

```
docker run -d --net host -e DISPLAY=$DISPLAY --device /dev/snd \
-v $HOME/.Xauthority:/root/.Xauthority --rm garo/xpra-chromium chromium-browser --no-sandbox
```

## Development
Want to improve this (bugfixes, extra features, ...) ?

Fork this repository on GitHub instead of cloning it,
I and other users might be interested in your changes !
