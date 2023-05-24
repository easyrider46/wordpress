
#!/bin/sh

#clean up previous build
docker-compose down

#build and start the containers
docker-compose up -d

#Wait for the containers to initialize
echo "Waiting for containers to initialize..."

sleep 10

#Display container status

docker-compose ps

#Display information to access the virtual lab
echo ""
echo "Virtual lab is now running!"

echo "you can access the lab at http://localhost:8080"





