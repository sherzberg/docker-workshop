---
layout: default
title: Basic Docker Commands
order: 2
---

{% highlight bash %}
docker run -i -t stackbrew/ubuntu:14.04 env

docker run -i -t stackbrew/ubuntu:14.04 echo "hi workshop peeps"

docker run -d -t stackbrew/ubuntu:14.04 sleep 1000

docker ps

docker top

docker ps -q

ID=$(docker ps -q)

docker inspect $ID

docker kill $ID

docker kill $(docker ps -q)

docker run -i -e MYVAR=hi -t stackbrew/ubuntu:14.04 env
{% endhighlight %}

Host info
---------

```bash
$ docker info
...
$ docker version
```

Exercises
---------

 * Using `docker logs` check the stdout of a container
 * Try out `docker attach` on a detached running container
 * With an interactive container, pipe the output to a file or another bash command
