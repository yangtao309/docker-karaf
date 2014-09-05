
#!/usr/bin/env bash

echo "Starting the karaf container"
docker run -p 8181 -i -t -v /Users/m2:/tmp/m2 docker-karaf:2.3.4  /bin/bash


