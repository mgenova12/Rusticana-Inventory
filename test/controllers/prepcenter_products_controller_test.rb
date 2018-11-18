require 'test_helper'

class PrepcenterProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prepcenter_products_index_url
    assert_response :success
  end

end
