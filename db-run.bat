@echo off
cd "%~dp0ai-detector-db"
echo Stopping and removing all Docker containers and associated volumes...
docker-compose down -v

echo Starting up the Docker containers...
docker-compose up
