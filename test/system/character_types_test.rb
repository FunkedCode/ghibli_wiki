require "application_system_test_case"

class CharacterTypesTest < ApplicationSystemTestCase
  setup do
    @character_type = character_types(:one)
  end

  test "visiting the index" do
    visit character_types_url
    assert_selector "h1", text: "Character Types"
  end

  test "creating a Character type" do
    visit character_types_url
    click_on "New Character Type"

    click_on "Create Character type"

    assert_text "Character type was successfully created"
    click_on "Back"
  end

  test "updating a Character type" do
    visit character_types_url
    click_on "Edit", match: :first

    click_on "Update Character type"

    assert_text "Character type was successfully updated"
    click_on "Back"
  end

  test "destroying a Character type" do
    visit character_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Character type was successfully destroyed"
  end
end
