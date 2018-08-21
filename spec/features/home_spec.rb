require 'rails_helper'

feature 'As an user I want to' do
  scenario 'see the home page' do
    visit root_path

    expect(page).to have_content("Hello World!")
  end
end
