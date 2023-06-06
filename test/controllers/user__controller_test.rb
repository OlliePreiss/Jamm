require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get genres" do
    get user__genres_url
    assert_response :success
  end
end
