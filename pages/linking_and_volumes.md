---
layout: default
title: Linking and Volumes
order: 5
---

A really awesome feature of `Docker` is container linking and volume linking. 
They allow containers to communicate together and share data between them and
the host.

Lets make sure our `workshop/exposing` container is running:

```bash
$ docker run -d -p 8000:8000 --name exposed -t workshop/exposing
...
$ docker ps
...
```

Notice the `--name exposed` parameter. This is so we can reference it later.

Run `/bin/bash` in another container where we link containers.

```bash
$ docker run -i --link exposed:exposed -t workshop /bin/bash
root@1234:/# env | grep sort
...
```

With that output you can see how `Docker` links containers, `ENV` variables.

While still in the container:

```bash
$ apt-get install -y wget
$ wget $EXPOSED_PORT_8000_TCP_ADDR:8000
$ cat index.html
```

Change your `Dockerfile` to this:

{% highlight text %}
  {% include linking_and_volumes/1/Dockerfile %}
{% endhighlight %}

```bash
$ docker build -t workshop/exposing .
```

We need to kill our docker container and restart it:

```bash
$ docker kill $(docker ps -q)
$ docker run -d -p 8000:8000 -v /home:/app -t workshop/exposing
```

Navigate to http://your-ip:8000 and see what contents show up

Exercises
---------

 * How does one share volumes between containers, not using the host?
 * Try linking multipe containers to one container
