---
layout: post
title:  "Docker cheat sheet"
date:   2021-03-19
---
### See installed version and basic info

```bash
$ docker version
$ docker info
```

### Run a container

```bash
$ docker run hello-world
```

### See list of containers

```bash
$ docker ps
```

Adding `--all` option shows all containers (by default it only shows containers running at this moment).

### See list of downloaded container images

```bash
$ docker images
```

### Remove container and delete downloaded image

```bash
$ docker container rm e1e7df81882c
$ docker image rm hello-world:latest
```

### Step by step for Postgres

1. Download image for Postgres 13:

    ```bash
    $ docker pull postgres:13
    ```

2. Install *psql* client:

    ```bash
    $ sudo apt install -y postgresql-client
    ```

3. Run Postgres container:
    * `-e` indicates we are passing an environment variable
    * `-p` sets up ports: `5433:5432` means port 5432 in container will be exposed and found as port 5433 from outside
    * `-d` says we want a detached execution

    ```bash
    $ docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5433:5432 -d postgres:13
    ```

4. Connect from *psql* using port indicated in first place in previous command:

    ```bash
    $ psql -p 5433 -h localhost -U postgres
    ```
