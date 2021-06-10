---
layout: post
title:  "Create .NET solution for web application project"
date:   2021-02-12
---
1. Create basic directory structure:

    ```bash
    $ mkdir MySolution
    $ mkdir MySolution/src
    $ mkdir MySolution/test
    ```

2. Create one *webapp* project and as many *classlib* projects as required for the application:

    ```bash
    $ cd MySolution/src
    $ dotnet new webapp -n Project1 -f net5.0
    $ dotnet new classlib -n Project2 -f net5.0 
    ```

3. Create one or more projects for tests:
    
    ```bash
    $ cd MySolution/test
    $ dotnet new xunit -n Tests -f net5.0
    ```
    
4. Create solution and add all projects to it:

    ```bash
    $ cd MySolution
    $ dotnet new sln --name MySolution
    $ dotnet sln MySolution.sln add src/Project1/Project1.csproj src/Project2/Project2.csproj test/Tests/Tests.csproj
    ```
