
#!/usr/bin/env bash

echo "Starting the karaf container"
docker run -p 22 -p 8181 -d -t -v /Users/m2:/tmp/m2  docker-karaf:2.3.4  


