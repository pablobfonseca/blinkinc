require 'rails_helper'

feature 'As an Admin I want to' do
  background { sign_in_as_admin }

  given!(:user) { create(:user, first_name: "Peter", last_name: "Parker") }

  scenario 'see the user page' do
    visit admin_users_path

    click_on "show_user_#{user.id}"

    expect(page).to have_content("Peter Parker")
  end
end
