# https://docs.tilt.dev/docker_compose.html
def run_api():
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

def run_bot():
  bot_dir = '../project__discord-bot'
  docker_build('discord-bot', bot_dir,
    live_update = [
      sync(bot_dir , '/usr/src/app'),
      run('npm install --production', trigger='package.json'),
      restart_container()
    ]
  )

  docker_build('discord-bot-migrations', bot_dir, dockerfile='%s/api/docker/migrations/Dockerfile' % bot_dir,
    live_update = [
      sync(bot_dir, '/usr/src/app'),
      restart_container()
    ]
  )

def run_strapi():
  strapi_dir = '../strapi'
  docker_build('strapi', strapi_dir ,
    live_update = [
      sync(strapi_dir, '/srv/app'),
      run('npm install --production', trigger='package.json'),
      restart_container()
    ]
  )

# https://docs.tilt.dev/tiltfile_config.html
config.define_string_list("to-run", args=True)
cfg = config.parse()

services = ['docker-compose.yaml', 'docker-compose-api.yaml', 'docker-compose-bot.yaml', 'docker-compose-strapi.yaml']
resources = ['db']
for arg in cfg.get('to-run', []):
  if arg == 'api':
    run_api()
    resources += ['api', 'api-migrations']
  elif arg == 'bot':
    run_bot()
    resources += ['discord-bot', 'discord-bot-migrations']
  elif arg == 'strapi':
    run_strapi()
    resources += ['strapi']

docker_compose(services)
config.set_enabled_resources(resources)
