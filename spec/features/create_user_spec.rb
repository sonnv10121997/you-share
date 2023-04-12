require 'rails_helper'

RSpec.feature "Creating an user", type: :feature do
  scenario 'when valid input' do
    visit new_user_registration_path
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_on "Sign up"
    expect(page).to have_content('Welcome test@gmail.com')
  end

  scenario 'when email and password are empty' do
    visit new_user_registration_path
    fill_in "user_email", with: ""
    fill_in "user_password", with: ""
    fill_in "user_password_confirmation", with: ""
    click_on "Sign up"
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'when password has 5 characters' do
    visit new_user_registration_path
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "12345"
    fill_in "user_password_confirmation", with: "12345"
    click_on "Sign up"
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario 'when password confirmation does not match' do
    visit new_user_registration_path
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "654321"
    click_on "Sign up"
    expect(page).to have_content("Password confirmation doesn't match")
  end

  scenario 'when email already exist' do
    # Create user
    visit new_user_registration_path
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_on "Sign up"
    expect(page).to have_content('Welcome test@gmail.com')
    click_on "Logout"

    # Create duplicate user
    visit new_user_registration_path
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_on "Sign up"
    expect(page).to have_content("Email has already been taken")
  end
end
