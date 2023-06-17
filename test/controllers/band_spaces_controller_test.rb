require "test_helper"

class BandSpacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get band_spaces_index_url
    assert_response :success
  end

  test "should get new" do
    get band_spaces_new_url
    assert_response :success
  end

  test "should get create" do
    get band_spaces_create_url
    assert_response :success
  end

  test "should get edit" do
    get band_spaces_edit_url
    assert_response :success
  end

  test "should get update" do
    get band_spaces_update_url
    assert_response :success
  end

  test "should get destroy" do
    get band_spaces_destroy_url
    assert_response :success
  end
end
