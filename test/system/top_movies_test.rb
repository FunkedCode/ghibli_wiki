require "application_system_test_case"

class TopMoviesTest < ApplicationSystemTestCase
  setup do
    @top_movie = top_movies(:one)
  end

  test "visiting the index" do
    visit top_movies_url
    assert_selector "h1", text: "Top Movies"
  end

  test "creating a Top movie" do
    visit top_movies_url
    click_on "New Top Movie"

    click_on "Create Top movie"

    assert_text "Top movie was successfully created"
    click_on "Back"
  end

  test "updating a Top movie" do
    visit top_movies_url
    click_on "Edit", match: :first

    click_on "Update Top movie"

    assert_text "Top movie was successfully updated"
    click_on "Back"
  end

  test "destroying a Top movie" do
    visit top_movies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Top movie was successfully destroyed"
  end
end
