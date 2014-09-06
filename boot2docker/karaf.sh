
#!/usr/bin/env bash

echo "Starting the karaf container"
docker run -p 22 -p 8181 -d -t -v /Users/m2:/root/.m2  docker-karaf:3.0.1  


