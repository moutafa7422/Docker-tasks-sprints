#!/bin/bash

# 1. Check the Docker version installed
docker_version=$(docker --version)
echo "Docker version: $docker_version"

# 2. Run Docker container for hello-world
docker run hello-world

# 3. Run Docker container redis in detached mode
docker run -d --name my-redis redis


# 4.  stop the running redis container
docker stop my-redis

# 5. Check all present containers on the host
docker ps -a

# 6. Check the ID of the redis container
redis_container_id=$(docker inspect -f "{{.Id}}"  my-redis)
echo "Redis container ID: $redis_container_id"

# 7. run a container from nginx:alpine and delete the image
docker run -d --name my-nginx nginx:alpine
docker rmi nginx:alpine

# 8. Delete the image redis
docker rmi redis

# 9. Pull image from nginx:1.14-alpine
docker pull nginx:1.14-alpine

# 10. Run an instance of the ubuntu image to run the sleep 1000 command at startup
docker run -d --name my-ubuntu ubuntu sleep 1000

# Exec into the container and touch a file called test-file
docker exec my-ubuntu touch test-file

# 11. Run a container with the nginx:alpine image and name it web
docker run --name web -d nginx:alpine

# 12. Delete all the images from the host
docker image prune -a --force
