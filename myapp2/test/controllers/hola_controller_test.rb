require "test_helper"

class HolaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hola_index_url
    assert_response :success
  end
end
