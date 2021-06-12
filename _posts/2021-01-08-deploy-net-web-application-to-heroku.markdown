---
layout: post
title:  "Deploy .NET web application to Heroku"
date:   2021-01-08
---
By default Heroku does not support the .NET platform. But as they say, _you can use any language that runs on Linux with Heroku via a third-party buildpack_. And that's exactly what happens with .NET, so we can use the [dotnetcore-buildpack](https://elements.heroku.com/buildpacks/jincod/dotnetcore-buildpack).

1. From Heroku main page, create a new application (i.e. *mydotnetapp* with region set to Europe).

1. Log in to Heroku from command line:

    ```bash
    $ heroku login
    ```

1. Set the buildpack our new app has to use:

    ```bash
    $ heroku buildpacks:set jincod/dotnetcore -a mydotnetapp
    ```

1. Set up Git in our project directory, keeping in mind the buildpack expects to find a *Program.cs* file in this directory. 

    ```bash
    $ git init
    $ heroku git:remote -a mydotnetapp
    ```
    
1. It's probably a good idea to create a *.gitignore* file to exclude everything we don't need to send to Heroku:

    ```
    .DS_Store
    bin/
    obj/
    appsettings.Development.json
    ```

1. Push project to Heroku:

    ```bash
    $ git add .
    $ git commit -m "First working version"
    $ git push heroku master
    ```

It's important to realize that this process is a bit different from what we do when deploying to other platforms as Azure:

* Azure &#8658; we push some *publish* folder after running:
 
    ```bash
    dotnet publish -c Release -o ./publish
    ```

* Heroku &#8658; we push the folder with our .NET project, the one that includes the *Program.cs* file (we don't need to previously run any `dotnet` command ourselves).
