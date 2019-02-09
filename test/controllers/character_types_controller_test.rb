require 'test_helper'

class CharacterTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character_type = character_types(:one)
  end

  test "should get index" do
    get character_types_url
    assert_response :success
  end

  test "should get new" do
    get new_character_type_url
    assert_response :success
  end

  test "should create character_type" do
    assert_difference('CharacterType.count') do
      post character_types_url, params: { character_type: {  } }
    end

    assert_redirected_to character_type_url(CharacterType.last)
  end

  test "should show character_type" do
    get character_type_url(@character_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_type_url(@character_type)
    assert_response :success
  end

  test "should update character_type" do
    patch character_type_url(@character_type), params: { character_type: {  } }
    assert_redirected_to character_type_url(@character_type)
  end

  test "should destroy character_type" do
    assert_difference('CharacterType.count', -1) do
      delete character_type_url(@character_type)
    end

    assert_redirected_to character_types_url
  end
end
