require 'rails_helper'

RSpec.feature "UpdatesConfigs", type: :feature do
  let(:config) { create(:active_config) }
  let(:email) { 'admin@gmail.com' }

  scenario 'Updates existing configuration key' do
    visit edit_active_config_path(config)
    fill_in 'active_config[key]', with: config.key
    fill_in 'active_config[value]', with: email
    select config.type, from: 'active_config[type]'
    click_button 'Save'

    expect(page).to have_text(email)
  end

end
