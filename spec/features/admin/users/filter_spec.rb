require 'rails_helper'

feature 'As an admin I want to filter by' do
  background { sign_in_as_admin }

  context 'first name' do
    before do
      create(:user, first_name: "John")
      create(:user, first_name: "Peter")
    end

    scenario 'filter by first name' do
      visit admin_users_path

      fill_in "q_search", with: "John"
      click_on "Search"

      within 'tbody' do
        expect(page).to have_css(:tr, count: 1)
      end
    end
  end
end
