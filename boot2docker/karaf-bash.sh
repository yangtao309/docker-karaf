
#!/usr/bin/env bash

echo "Starting the karaf container"
docker run -p 8181 -i -t -v /Users/m2:/root/.m2 docker-karaf:3.0.1  /bin/bash


