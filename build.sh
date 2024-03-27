IMAGE_NAME=docker-mytinytodo
docker container stop roger
docker image rm $IMAGE_NAME
docker build -t "$IMAGE_NAME:latest" .
