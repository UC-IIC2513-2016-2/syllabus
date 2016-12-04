require 'test_helper'

class TrojansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trojan = trojans(:one)
  end

  test "should get index" do
    get trojans_url
    assert_response :success
  end

  test "should get new" do
    get new_trojan_url
    assert_response :success
  end

  test "should create trojan" do
    assert_difference('Trojan.count') do
      post trojans_url, params: { trojan: { name: @trojan.name } }
    end

    assert_redirected_to trojan_url(Trojan.last)
  end

  test "should show trojan" do
    get trojan_url(@trojan)
    assert_response :success
  end

  test "should get edit" do
    get edit_trojan_url(@trojan)
    assert_response :success
  end

  test "should update trojan" do
    patch trojan_url(@trojan), params: { trojan: { name: @trojan.name } }
    assert_redirected_to trojan_url(@trojan)
  end

  test "should destroy trojan" do
    assert_difference('Trojan.count', -1) do
      delete trojan_url(@trojan)
    end

    assert_redirected_to trojans_url
  end
end
