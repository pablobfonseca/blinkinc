require 'rails_helper'

feature 'As an admin I want to' do
  background { sign_in_as_admin }

  scenario 'create users' do
    visit admin_users_path

    click_on "New User"

    expect {
      fill_in "First Name", with: Faker::Name.first_name
      fill_in "Last Name", with: Faker::Name.last_name
      fill_in "Email", with: Faker::Internet.email
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_on "Create User"
    }.to change(User, :count).by(1)
  end

  scenario 'view the message of invalid params' do
    visit admin_users_path

    click_on "New User"
    click_on "Create User"

    expect(page).to have_content(/can't be blank/)
  end
end
