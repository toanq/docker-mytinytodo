IMAGE_NAME=carcise/docker-mytinytodo
VERSION=1.8.1
docker container stop tinytodo
docker image rm $IMAGE_NAME
docker build -t "$IMAGE_NAME:latest" -t "$IMAGE_NAME:$VERSION" .
