# Docker karaf

## Start Checkout code source
 
```
git clone https://github.com/yangtao309/docker-karaf.git
```

## Build Docker Dockerfile

```
sh build.sh
```

## Run Docker Image

### Background
```
sh karaf.sh

docker ps 

docker port <container_id> <port>

ssh root@127.0.0.1 -p <port>
```
### Interactive /bin/bash

```
sh karaf-bash.sh
```

## Access Karaf web console

http://ip-address:port/system/console

