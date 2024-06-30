require "test_helper"

class ShippingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipping_index_url
    assert_response :success
  end

  test "should get edit" do
    get shipping_edit_url
    assert_response :success
  end

  test "should get show" do
    get shipping_show_url
    assert_response :success
  end

  test "should get new" do
    get shipping_new_url
    assert_response :success
  end
end
