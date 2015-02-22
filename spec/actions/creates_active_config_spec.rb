require 'rails_helper'

RSpec.describe CreatesActiveConfig, type: :action do
  subject { CreatesActiveConfig.new(services) }
  let(:active_configs) { double 'ActiveRecord ActiveConfig' }
  let(:services) {
    { 'ActiveConfigs' => active_configs }
  }
  let(:active_config) { double 'ActiveConfig', id: 1 }
  let(:config_params) { { key: 'email', value: 'rails@gmail.com', type: 'String' } }

  it 'creates new config' do
    expect(active_configs).to receive(:create!).with(config_params) { active_config }
    subject.create params: config_params
  end

end
