# https://docs.tilt.dev/docker_compose.html
api_dir = '../platform__api'
docker_build('platform-api', api_dir,
  live_update = [
    sync(api_dir, '/usr/src/app'),
    run('npm install --production', trigger='package.json'),
    restart_container()
  ]
)
docker_build('platform-api-migration', api_dir, dockerfile='%s/docker/migrations/Dockerfile' % api_dir,
  live_update = [
    sync(api_dir, '/usr/src/app'),
    restart_container()
  ]
)

bot_dir = '../project__discord-bot'
docker_build('discord-bot', bot_dir,
  live_update = [
    sync(bot_dir , '/usr/src/app'),
    run('npm install --production', trigger='package.json'),
    restart_container()
  ]
)
docker_build('discord-bot-migration', bot_dir, dockerfile='%s/api/docker/migrations/Dockerfile' % bot_dir,
  live_update = [
    sync(bot_dir, '/usr/src/app'),
    restart_container()
  ]
)
docker_compose('docker-compose.yaml')
