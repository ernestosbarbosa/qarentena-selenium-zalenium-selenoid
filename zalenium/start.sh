docker pull dosel/zalenium

docker run -d --rm -ti --name zalenium -p 4444:4444 \
    -e PULL_SELENIUM_IMAGE=true \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /tmp/videos:/home/seluser/videos \
    --privileged dosel/zalenium start
