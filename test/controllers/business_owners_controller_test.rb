require 'test_helper'

class BusinessOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_owner = business_owners(:one)
  end

  test "should get index" do
    get business_owners_url
    assert_response :success
  end

  test "should get new" do
    get new_business_owner_url
    assert_response :success
  end

  test "should create business_owner" do
    assert_difference('BusinessOwner.count') do
      post business_owners_url, params: { business_owner: { business_name: @business_owner.business_name, email: @business_owner.email, password: @business_owner.password, user_name: @business_owner.user_name } }
    end

    assert_redirected_to business_owner_url(BusinessOwner.last)
  end

  test "should show business_owner" do
    get business_owner_url(@business_owner)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_owner_url(@business_owner)
    assert_response :success
  end

  test "should update business_owner" do
    patch business_owner_url(@business_owner), params: { business_owner: { business_name: @business_owner.business_name, email: @business_owner.email, password: @business_owner.password, user_name: @business_owner.user_name } }
    assert_redirected_to business_owner_url(@business_owner)
  end

  test "should destroy business_owner" do
    assert_difference('BusinessOwner.count', -1) do
      delete business_owner_url(@business_owner)
    end

    assert_redirected_to business_owners_url
  end
end
