docker build -f platform__api/Dockerfile -t platform-api platform__api
docker build -f platform__api/docker/migrations/Dockerfile -t platform-api-migration platform__api
docker build -f project__discord-bot/Dockerfile -t discord-bot project__discord-bot
docker-compose -f platform__dev-env/docker-compose.yaml up
docker-compose -f platform__dev-env/docker-compose.yaml down