# Dev Launchers platform dev env
This repository hosts the docker-compose file to run the api, bot and database to emulate the backend environment.

# Prerequisites
1. Docker
We will use Docker to build and manage containers
Pick the Docker for your operating systems.
For Windows, refer to https://docs.docker.com/docker-for-windows/install/.
For Mac, refer to https://docs.docker.com/docker-for-mac/install/.
2. Tilt
We use Tilt to provide a frontend for docker-compose, and rebuild containers when source is changed.
Refer to https://docs.tilt.dev/install.html to install tilt.
We are not using kubernetes, so skip kubernetes installation.

# Setup
1. make sure your file structure looks like this
```
├── plaform__api
├── platform__dev-env
├── project__discord-bot
```
2. Make sure to add all the env var to the `api.env.example`. After adding all the env var,
make sure to remove .example from `api.env.example`. It should look like this `api.env`.
If you don't know the env var, just ask in the backend-chat channel on discord and someone
should send you all the env vars.

# Running
In the root directory of this repo, run `run.sh` to spin up all services. If that doesn't work try running `./run.sh`.
If you only want to run a subset of services run `run.sh <service 1>, <service 2> ... <service n>`.
For example, if you only want to run the api, run `run.sh api`. If you want to run the bot, run `run.sh bot`.
Tilt will automatically detect change in source and handle restarts.
It also provides an UI to read logs from each container, and restart them at http://localhost:10350/.
