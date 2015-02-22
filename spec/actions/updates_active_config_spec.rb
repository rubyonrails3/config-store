require 'rails_helper'

RSpec.describe UpdatesActiveConfig do
  subject { UpdatesActiveConfig.new(services) }
  let(:active_configs) { double 'ActiveRecord ActiveConfig' }
  let(:services) { 
    { 'ActiveConfigs' => active_configs  }
  }
  let(:active_config) { double 'ActiveConfig', id: 1 }
  let(:config_params) { { key: 'email', value: 'admin@example.com', type: 'String' } }

  it 'updates the config' do
    expect(active_config).to receive(:update!).with(config_params) { true }
    subject.update config: active_config, params: config_params
  end
end
