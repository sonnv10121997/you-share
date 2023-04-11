require "application_system_test_case"

class SharedMoviesTest < ApplicationSystemTestCase
  setup do
    @shared_movie = shared_movies(:one)
  end

  test "visiting the index" do
    visit shared_movies_url
    assert_selector "h1", text: "Shared movies"
  end

  test "should create shared movie" do
    visit shared_movies_url
    click_on "New shared movie"

    fill_in "Url", with: @shared_movie.url
    fill_in "User", with: @shared_movie.user_id
    click_on "Create Shared movie"

    assert_text "Shared movie was successfully created"
    click_on "Back"
  end

  test "should update Shared movie" do
    visit shared_movie_url(@shared_movie)
    click_on "Edit this shared movie", match: :first

    fill_in "Url", with: @shared_movie.url
    fill_in "User", with: @shared_movie.user_id
    click_on "Update Shared movie"

    assert_text "Shared movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Shared movie" do
    visit shared_movie_url(@shared_movie)
    click_on "Destroy this shared movie", match: :first

    assert_text "Shared movie was successfully destroyed"
  end
end
