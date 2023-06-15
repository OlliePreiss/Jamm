require "test_helper"

class MusicStudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get music_studios_index_url
    assert_response :success
  end
end
