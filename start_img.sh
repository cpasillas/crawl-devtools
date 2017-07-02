docker stop crawl-d
docker rm crawl-d
docker run --restart 'on-failure' -d -p 80:80 --name crawl-d \
-v /home/chris/dev/crawl-data:/data \
crawl-d
