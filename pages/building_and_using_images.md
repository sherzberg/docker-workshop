---
layout: default
title: Building and using images
order: 3
---

First, create a file called Dockerfile in your current folder with
this as the contents:

{% highlight js %}
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

{% highlight js %}
  {% include building_and_using_images/2/Dockerfile %}
{% endhighlight %}
