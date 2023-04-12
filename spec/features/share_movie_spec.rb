require 'rails_helper'

RSpec.feature "Share a movie", type: :feature do
  context "when user is not logged in" do
    scenario do
      visit new_shared_movie_path
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context "when user logged in" do
    before do
      # Create new user
      visit new_user_registration_path
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "123456"
      fill_in "user_password_confirmation", with: "123456"
      click_on "Sign up"
    end

    scenario 'when share movie without url and title' do
      visit new_shared_movie_path
      fill_in "shared_movie_url", with: ""
      fill_in "shared_movie_title", with: ""
      click_on "Share"
      expect(page).to have_content("Url can't be blank")
      expect(page).to have_content("Title can't be blank")
    end

    scenario 'when share movie successfully' do
      visit new_shared_movie_path
      fill_in "shared_movie_url", with: "https://www.youtube.com/embed/iuk77TjvfmE"
      fill_in "shared_movie_title", with: "Marvel Studios’ The Marvels | Teaser Trailer"
      click_on "Share"
      expect(page).to have_content("Marvel Studios’ The Marvels | Teaser Trailer")
      expect(page).to have_content("Shared by: test@gmail.com")
    end
  end
end
