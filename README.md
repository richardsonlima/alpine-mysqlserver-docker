# alpine-mysqlserver

# build image
```bash
docker build -t richardsonlima/alpine-mysqlserver .
docker run -it --rm -v $(pwd):/app -p 2206:3306 richardsonlima/alpine-mysqlserver
```

# Usage
```bash
docker run -it --name mysql -p 3306:3306 -v $(pwd):/app -e MYSQL_DATABASE=admin -e MYSQL_USER=dbadminuser -e MYSQL_PASSWORD=dpa\*12d -e MYSQL_ROOT_PASSWORD=JwYKj8tSnpyDFUdGuA==J richardsonlima/alpine-mysql
```
*It will create a new db, and set mysql root password
(default is JwYKj8tSnpyDFUdGuA==J)
