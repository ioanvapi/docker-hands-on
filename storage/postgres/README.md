# Postgres

Install both postgres db server and postgres admin web app as docker containers.

[Postgres official image](https://hub.docker.com/_/postgres)

[pgadmin4 image](https://hub.docker.com/r/dpage/pgadmin4)




```docker
docker run -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres --net host --name postgres postgres
```


```docker
docker run -p 5555:80 -e PGADMIN_DEFAULT_EMAIL=pgadmin@home.com -e PGADMIN_DEFAULT_PASSWORD=pgadmin --net host --name pgadmin4 dpage/pgadmin4
```