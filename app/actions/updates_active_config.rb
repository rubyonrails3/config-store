class UpdatesActiveConfig < Struct.new(:services)

  def update config:, params: {}
    result = config.update!(params)
    Rails.cache.write("#{Rails.env}/#{config.key}", config.value) unless Rails.env.test?
    result
  end
end
