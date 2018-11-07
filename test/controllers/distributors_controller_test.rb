require 'test_helper'

class DistributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get distributors_index_url
    assert_response :success
  end

  test "should get new" do
    get distributors_new_url
    assert_response :success
  end

  test "should get edit" do
    get distributors_edit_url
    assert_response :success
  end

end
