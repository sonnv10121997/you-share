require "test_helper"

class SharedMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shared_movie = shared_movies(:one)
  end

  test "should get index" do
    get shared_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_shared_movie_url
    assert_response :success
  end

  test "should create shared_movie" do
    assert_difference("SharedMovie.count") do
      post shared_movies_url, params: { shared_movie: { url: @shared_movie.url, user_id: @shared_movie.user_id } }
    end

    assert_redirected_to shared_movie_url(SharedMovie.last)
  end

  test "should show shared_movie" do
    get shared_movie_url(@shared_movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_shared_movie_url(@shared_movie)
    assert_response :success
  end

  test "should update shared_movie" do
    patch shared_movie_url(@shared_movie), params: { shared_movie: { url: @shared_movie.url, user_id: @shared_movie.user_id } }
    assert_redirected_to shared_movie_url(@shared_movie)
  end

  test "should destroy shared_movie" do
    assert_difference("SharedMovie.count", -1) do
      delete shared_movie_url(@shared_movie)
    end

    assert_redirected_to shared_movies_url
  end
end
