# Postgres

Install both postgres db server and postgres admin web app as docker containers.

[Postgres official image](https://hub.docker.com/_/postgres)

[pgadmin4 image](https://hub.docker.com/r/dpage/pgadmin4)

Start the postgress database:

```docker
docker run -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres --net host --name postgres postgres
```

Start the pgadmin GUI.

```docker
docker run -p 5555:80 -e PGADMIN_DEFAULT_EMAIL=pgadmin@home.com -e PGADMIN_DEFAULT_PASSWORD=pgadmin --net host --name pgadmin4 dpage/pgadmin4
```

Note: Both use docker host network and -p is not required since host nework is a public network and ports are implicitely exposed. This way pgadmin can connect to server using `localhost` name.

If you want to isolate the communication between pgadmin and dbserver use the default `bridge` network or create a custom bridge nework and use it. This time, pgadmin can rezolve the server by its name or you can inspect the postgress container ip and use it in pgadmin to connect to database.

```bash
export MY_NET=postgres-net
docker network create $MY_NET

docker run --rm -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres --net $MY_NET --name postgres postgres

docker run --rm -p 5555:5555 -e PGADMIN_DEFAULT_EMAIL=pgadmin@home.com -e PGADMIN_DEFAULT_PASSWORD=pgadmin --net $MY_NET --name pgadmin4 dpage/pgadmin4
```

## Create pre-populated database

Check out the sql init script: `init.sql`. Use the Dockerfile in order to create a new postgres db image pre-populated with a new database, table and some rows in that table.

* new database `company`
* new `employee` table in `company` database
* some rows inserted in `employee` table

The Dockerfile copies the init.sql script to the right place. If postgress find no data in `/var/lib/postgresql/data` when starts then it will execute scripts from `/docker-entrypoint-initdb.d`.

Docker mounts `/var/lib/postgresql/data` (image folder) to host `/var/lib/docker/volumes/<someid>/_data/` folder. You can find it inspecting the postgress docker image/container.

Create the new image:

```bash
docker build . -t my-postgress:1.0
```

Run the new image:
```docker
docker run --rm -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres --net host --name my-postgres my-postgres:1.0
```

Now, if you connect to this server with pgadmin you will find the new database, table and rows.
