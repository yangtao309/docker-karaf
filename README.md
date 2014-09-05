# Docker karaf

##support

  OS
  * MAC OSX boot2docker 1.1.2 (64bit)
  * Windows boot2docker 1.1.2 (64bit)
  

need to replace $HOME/.boot2docker/boot2docker.iso 
  
new iso download url: http://static.dockerfiles.io/boot2docker-v1.1.2-virtualbox-guest-additions-v4.3.12.iso
 
 MAC OSX
 ```
 cd ~
 mv boot2docker.iso boot2docker-official.iso
 cp ~/Downloads/boot2docker-v1.1.2-virtualbox-guest-additions-v4.3.12.iso ~/.boot2docker/
 mv boot2docker-v1.1.2-virtualbox-guest-additions-v4.3.12.iso boot2docker.iso 
 
 setpath=~/docker-sharing
 VBoxManage sharedfolder add boot2docker-vm -name home -hostpath $docker-sharing
 ```

 Windows (manual replace boot2docker.iso and set new maven repository name D:/docker-sharing/m2/repository)
 ```
 setpath=/d/docker-sharing/
 /c/Program\ Files/Oracle/VirtualBox/VBoxManage sharedfolder add boot2docker-vm -name home -hostpath $setpath
 ```
 
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

## Access Karaf web console in firefox | chrome 

http://ip-address:port/system/console

(for example: http://192.168.12.153:49154/system/console)

