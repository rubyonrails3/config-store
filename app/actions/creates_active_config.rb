class CreatesActiveConfig < Struct.new(:services)

  def create params: {}
    services['ActiveConfigs'].create! params
  end
end
