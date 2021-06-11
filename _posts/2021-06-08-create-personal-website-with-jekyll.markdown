---
layout: post
title:  "Create personal website with Jekyll"
date:   2021-06-08
---
## First steps

1. Install Jekyll:

    ```bash
    $ gem install bundler jekyll
    ```

2. Create project:

    ```bash
    $ jekyll new AlbertMata
    ```

3. Generate site and start web server:

    ```bash
    $ cd AlbertMata
    $ bundle exec jekyll serve
    ```
    
Then we can find the site at [http://localhost:4000](http://localhost:4000).

## Publish to GitHub Pages

I have two different repositories on GitHub:

1. First one is for the Jekyll project itself. I've called it [Jekyll](https://github.com/almata/Jekyll) and it corresponds to *AlbertMata* directory in my computer. A new push operation is required anytime something changes in the structure of the site (i.e. CSS styles).

    ```bash
    $ cd AlbertMata
    $ git remote add origin https://github.com/almata/Jekyll.git
    ```

2. Second one is for the website. It has to be named [almata.github.io](https://github.com/almata/almata.github.io) to match GitHub Pages requirements. It corresponds to *AlbertMata/\_site* subdirectory in my computer. A new push operation is required anytime there is any change in this website (content, styles, structure... whatever).

    ```bash
    $ cd AlbertMata/_site
    $ git remote add origin https://github.com/almata/almata.github.io.git
    ```

That is... I have a first Git repository for *AlbertMata* directory and a second Git repository for *\_site* subdirectory (this *\_site* subdirectory is included in the *.gitignore* file of the first Git repository).

As most of the time a push operation is required is just because I've added a new note, I've created a *publi.sh* shell script to do that:

```bash
#!/bin/bash

git add .
git commit -m "(Note) $1"
git push origin master
cd _site
git checkout CNAME
git add .
git commit -m "(Note) $1"
git push origin master
cd ..
```

This way I just need one command to push changes to both repositories at once:

```bash
$ ./publi.sh "Create personal website with Jekyll"
```

## Use custom domains

To redirect [albertmata.net](https://albertmata.net) to this website I've need to create a file named *CNAME* in the *\_site* subdirectory with this exact content:

{% highlight text %}
albertmata.net
{% endhighlight %}

To redirect [albertmata.com](http://albertmata.com), I've added a forward rule from Hover following instructions in [Domain forwarding](https://help.hover.com/hc/en-us/articles/217282447-Domain-forwarding). It works well, except for HTTPS, as I'd need a SSL certificate for that.

## Customize theme

Jekyll uses Minima theme by default. Instructions on how to do changes on a theme can be found at [Jekyll Themes](https://jekyllrb.com/docs/themes). Easiest approach seems to be to copy and paste all the content from Minima into our project and then change whatever is necessary there. We can find out where the Minima theme directory is in our computer with:

```bash
$ bundle info --path minima
```

And open that folder in Finder with:

```bash
$ open $(bundle info --path minima)
```
