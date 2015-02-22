services = {}

services['ActiveConfigs'] = ActiveConfig
services['CreatesActiveConfig'] = CreatesActiveConfig.new(services)
services['UpdatesActiveConfig'] = UpdatesActiveConfig.new(services)

Rails.application.config.services = services
