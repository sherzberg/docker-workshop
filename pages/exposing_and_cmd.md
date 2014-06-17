---
layout: default
title: Exposing Ports and CMD
order: 4
---

Running confined containers is useful and fun, but what if we could open up some ports
to communicate with the outside world?

Exposing Ports
--------------

Replace your `Dockerfile` with this one:

{% highlight text %}
{% include exposing_and_cmd/1/Dockerfile %}
{% endhighlight %}

Now build it:

```bash
$ docker build -t workshop/exposing .
...
```

Make sure it works:

```bash
$ docker run -i -t workshop/exposing ruby --version
ruby 1.9.3p484 (2013-11-22 revision 43786) [x86_64-linux]
```

Lets use the port 8000:

```bash
$ docker run -i -p 8000:8000 -t workshop/exposing ruby -run -e httpd /var/log -p 8000
```

Now navigate to http://your-ip:8000

Custom container commands
-------------------------

Now that we have a long running task to run, what if I told you you didn't have
to type your command every time???

Replace your `Dockerfile` with this one:

{% highlight text %}
{% include exposing_and_cmd/2/Dockerfile %}
{% endhighlight %}

```bash
$ docker build -t workshop/exposing .
```

Now we can just run the image with:

```bash
$ docker run -i -p 8000:8000 -t workshop/exposing
```

Ops now can run your app with _NO_ knowledge of your app! Mostly...

Exercises
---------

 * What happens when you replace `8000:8000` with just `8000`?
  * Hint, also replace `-i` with `-d`
 * Can you pass parameters to images with `CMD`?
