docker pull selenoid/chrome:86.0

docker run -d \
    --name selenoid \
    -p 4444:4444 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $(pwd)/config/:/etc/selenoid/:ro \
    aerokube/selenoid:latest-release --limit 8 

docker run -d --name selenoid-ui  \
   --link selenoid \
   -p 8080:8080 \
   aerokube/selenoid-ui --selenoid-uri=http://selenoid:4444