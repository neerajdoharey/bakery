require 'test_helper'

class OrderLineItemHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_line_item_histories_index_url
    assert_response :success
  end

end
