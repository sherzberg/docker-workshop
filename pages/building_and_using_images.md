---
layout: default
title: Building and using images
order: 3
---

First, create a file called Dockerfile in your current folder with
this as the contents:

{% highlight text %}
{% include building_and_using_images/1/Dockerfile %}
{% endhighlight %}

This is a really basic `Dockerfile` that can be used to create a Docker image.


```bash
$ docker build -t workshop .
Sending build context to Docker daemon  2.56 kB
Sending build context to Docker daemon 
Step 0 : FROM stackbrew/ubuntu:14.04
 ---> ad892dd21d60
Step 1 : RUN apt-get update
 ---> Using cache
 ---> 825917f07e67
Successfully built 825917f07e67
```

Now, run it a second time. Faster huh? Docker will cache Dockerfile steps!

Lets add a few more things:

{% highlight text %}
{% include building_and_using_images/2/Dockerfile %}
{% endhighlight %}

Now lets rebuilding and try running this image with some commands:

```bash
$ docker build -t workshop .
...
$ docker run -i -t workshop /usr/games/cowsay hello there!
...
```

As we keep adding to the `Dockerfile` you can see the steps are being
cached. Caching occurs when step actions do not change. Pay close attention
to ording of steps.

Next lets try adding local files. Create a file called _myfile.txt_ in the
current directory with this as the contents:

{% highlight text %}
{% include building_and_using_images/3/myfile.txt %}
{% endhighlight %}

Now add the last line to your `Dockerfile`:

{% highlight text %}
{% include building_and_using_images/3/Dockerfile %}
{% endhighlight %}

Now, lets see the container have access to it:

```bash
$ docker run -i -t workshop cat /app/myfile.txt
...
```

Exercises
---------

 * Using our `workshop` tag, build a new `Dockerfile` that uses this tag as the base
 * How can you add a whole folder to the image?
