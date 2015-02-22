class ActiveConfigsController < ApplicationController

  before_action :set_active_config, only: [:edit, :update]


  def index
    @configs = services['ActiveConfigs'].all
  end

  def new
    @config = services['ActiveConfigs'].new
  end

  def create
    @config = services['CreatesActiveConfig'].create params: config_params
    redirect_to active_configs_path, notice: 'Configuration Created Successfully.'
  end


  def edit
    render template: 'active_configs/new'
  end

  def update
    @config = services['UpdatesActiveConfig'].update config: @config, params: config_params
    redirect_to active_configs_path, notice: 'Configuration Updated Successfully.'
  end

  private

  def set_active_config
    @config = services['ActiveConfigs'].find params[:id]
  end

  def config_params
    params.require(:active_config).permit(:key, :value, :type)
  end
end
