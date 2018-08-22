require 'rails_helper'

feature 'As an admin I want to' do
  background do
    sign_in_as_admin
    create_list(:user, 2)
  end

  scenario 'see the list of created users' do
    visit admin_users_path

    within 'tbody' do
      expect(page).to have_css(:tr, count: 2)
    end
  end
end
