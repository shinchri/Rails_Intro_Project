require 'test_helper'

class ChefsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chefs_index_url
    assert_response :success
  end

  test "should get show" do
    get chefs_show_url
    assert_response :success
  end

end
