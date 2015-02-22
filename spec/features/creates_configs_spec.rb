require 'rails_helper'

RSpec.feature "CreatesConfigs", type: :feature do

  let(:config) { build(:active_config) }

  scenario 'Creates new configuration key' do
    visit new_active_config_path
    fill_in 'active_config[key]', with: config.key
    fill_in 'active_config[value]', with:  config.value
    select config.type, from: 'active_config[type]'
    click_button 'Save'

    expect(page).to have_text(config.value)
  end

end
