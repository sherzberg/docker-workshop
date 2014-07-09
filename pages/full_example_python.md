---
layout: default
title: Full Example (python)
order: 7
---

Cool, now lets try a full example. Lets say we have a `flask` webapp and `rq` as a
background worker.

Python + flask setup
--------------------

Lets put this `Dockerfile` into a new folder:

{% highlight text %}
{% include full_example_python/Dockerfile %}
{% endhighlight %}

This `Dockerfile` will install the base dependencies for a `Flask` app. The base image `sherzberg/python-all-dev` already has the development versions of python installed.

You also need to create a file called `app.py` in that folder:

{% highlight python %}
{% include full_example_python/app.py %}
{% endhighlight %}

And lets see if it works:

```bash
$ docker build -t workshop/python-full .
...
$ docker run -i -p 5000:5000 -v $(pwd):/app -t workshop/python-full python app.py
```

If you don't get any errors, navigate to http://your-ip:5000

rq setup
--------

First, we need redis:

```bash
$ docker run --name redis -d redis
```
Now create _tasks.py_ for the `rq` worker code.

{% highlight python %}
{% include full_example_python/tasks.py %}
{% endhighlight %}

Run the `rq` worker:

```bash
$ sudo docker run -i -p 5000:5000 --link redis:redis -v $(pwd):/app -t workshop/python-full python tasks.py
```

Try it out:

```bash
$ sudo docker run -i --link redis:redis -v $(pwd):/app -t workshop/python-full python
>>> from tasks import q, calculate
>>> q.enqueue(calculate, 1, 3)
```

Look at the console output of the worker.

Exercises
---------

 * What hosts entries exist so we can get rid of _os.environ_?
 * Enqueue `calculate` on _/calculate?a=1&b=3_
 * Extra: Enable `workshop/python-full` to allow `docker run -t workshop/-full` to serve the app.
