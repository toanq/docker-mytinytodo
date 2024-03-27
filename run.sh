mkdir -p ./db
docker container stop roger
docker run --rm --name roger -p 8888:80 -v ./db:/var/www/html/db -dit docker-mytinytodo
