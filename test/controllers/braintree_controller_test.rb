require 'test_helper'

class BraintreeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get braintree_index_url
    assert_response :success
  end

end
