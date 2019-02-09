require 'test_helper'

class TopMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @top_movie = top_movies(:one)
  end

  test "should get index" do
    get top_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_top_movie_url
    assert_response :success
  end

  test "should create top_movie" do
    assert_difference('TopMovie.count') do
      post top_movies_url, params: { top_movie: {  } }
    end

    assert_redirected_to top_movie_url(TopMovie.last)
  end

  test "should show top_movie" do
    get top_movie_url(@top_movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_top_movie_url(@top_movie)
    assert_response :success
  end

  test "should update top_movie" do
    patch top_movie_url(@top_movie), params: { top_movie: {  } }
    assert_redirected_to top_movie_url(@top_movie)
  end

  test "should destroy top_movie" do
    assert_difference('TopMovie.count', -1) do
      delete top_movie_url(@top_movie)
    end

    assert_redirected_to top_movies_url
  end
end
