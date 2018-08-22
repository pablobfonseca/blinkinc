require 'rails_helper'

feature 'As an admin I want to' do
  background do
    sign_in_as_admin
  end

   given!(:user) { create(:user, first_name: "John", last_name: "Doe") }

  scenario 'edit an user' do
    visit admin_users_path

    click_on "edit_user_#{user.id}"

    expect {
      fill_in "First Name", with: "Peter"
      fill_in "Last Name", with: "Parker"

      click_on "Update User"
    }.to change { user.reload.first_name }.from("John").to("Peter")
  end

  scenario 'see the message when invalid params' do
    visit admin_users_path

    click_on "edit_user_#{user.id}"

    fill_in "First Name", with: ""

    click_on "Update User"

    expect(page).to have_content(/can't be blank/)
  end
end
