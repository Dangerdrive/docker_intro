# docker_intro

In this project, we will learn how to use docker to create a development environment. We will connect to a mysql database within a docker container.

# useful vscode extensions
- Docker (view containers, images, etc)
- Database client (it is like mysql workbench)

search for the mysql image in the docker hub
```
https://hub.docker.com/_/mysql/
```
RTFM!


if needed, install docker.

# installing docker on ubuntu
```
sudo apt-get update
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker
```

```bash
$ docker run --name mysql_42 -e MYSQL_ROOT_PASSWORD=1234 -p 3307:3306 -d mysql:latest
```
-e is for environment variables

-d mysql:tag is for the image and the tag. Tag can be a specific version or latest

```bash

if the image is not found, it will be downloaded from the docker hub

the first port is the port of the host machine, the second port is the port of the container. So we are mapping the port 3306 of the container to the port 3307 of the host machine. Since I have MySQL installed on my machine, I cannot use the default port 3306. I will use 3307 instead.

In other scenarios, we can use the same port for the host and the container. 

```bash
$ docker ps
```
ps stands for process status. For docker, it will show the running containers

```bash
$ docker stop mysql_42
```

# connecting to the mysql database from terminal
```bash
mysql -h 127.0.0.1 -P 3307 -u root -p
```
-h 127.0.0.1 specifies the host, which is your local machine.
-P 3307 specifies the port.
-u root is the username. I used root here since you're likely using the root user.
-p will prompt you for the password, which you set as 1234.

# connecting to the mysql database from node.js application
```javascript

const mysql = require('mysql');
const connection = mysql.createConnection({
  host: 'localhost',
  port: 3307,
  user: 'root',
  password: '1234',
  database: 'your_database_name'
});
```

docker logs mysql_42

use docker exec to run a command in a running container
```bash
docker exec -it mysql_42 bash
```

docker exec -it mysql_42 mysql -uroot -p
