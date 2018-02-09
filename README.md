# alpine-mysqlserver


# build image
docker build -t richardsonlima/alpine-mysqlserver .
docker run -it --rm -v $(pwd):/app -p 2206:3306 richardsonlima/alpine-mysqlserver

# Usage

docker run -it --name mysql -p 3306:3306 -v $(pwd):/app -e MYSQL_DATABASE=admin -e MYSQL_USER=richardson -e MYSQL_PASSWORD=dpa\*12d -e MYSQL_ROOT_PASSWORD=111111 richardsonlima/alpine-mysql

*It will create a new db, and set mysql root password(default is )
