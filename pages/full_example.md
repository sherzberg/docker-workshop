---
layout: default
title: Full Example
order: 6
---

Cool, now lets try a full example. Lets say we have a `passenger` + `ruby` and a database webapp.

Passenger/rack/ruby setup
-------------------------

Lets put this `Dockerfile` into a new folder:

{% highlight text %}
{% include full_example/Dockerfile %}
{% endhighlight %}

This base image, `litaio/ruby` already has build out Ruby 2.1.2 for us. You can check out that images Dockerfile [here](https://github.com/litaio/dockerfiles/blob/master/ruby/Dockerfile).

You also need to create a file called `config.ru` in that folder:

{% highlight ruby %}
{% include full_example/ruby/config.ru %}
{% endhighlight %}

And lets see if it works:

```bash
$ docker build -t workshop/full .
...
$ docker run -i -p 3000:3000 -v $(pwd):/app -t workshop/full passenger start
```

If you don't get any errors, navigate to http://your-ip:8000

Sinatra setup
-------------

Sinatra is a nice little webframework with minial configuration. Lets replace our `config.ru` with:

{% highlight ruby %}
{% include full_example/sinatra/config.ru %}
{% endhighlight %}

We also need our Sinatra code in `app.rb`:

{% highlight ruby %}
{% include full_example/sinatra/app.rb %}
{% endhighlight %}

```bash
$ docker run -i -p 3000:3000 -v $(pwd):/app -t workshop/full passenger start
```

If you don't get any errors, navigate to http://your-ip:8000

Database setup
--------------
 
Lets start a database:

```bash
$ docker run -d --name db -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root orchardup/mysql
...
$ mysql -uroot -h127.0.0.1 -proot

mysql> show databases;
...
```

Exercises
---------

 * Using ActiveRecord, connect to the database with ruby
 * Insert records on `/add`, list records on `/`
 * Stop and start the web container, does your data still exist?
  * How about the database container?
 * Extra: Enable `workshop/full` to allow `docker run -t workshop/full` to serve the app.
