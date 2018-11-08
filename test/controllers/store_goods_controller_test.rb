require 'test_helper'

class StoreGoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_goods_index_url
    assert_response :success
  end

end
