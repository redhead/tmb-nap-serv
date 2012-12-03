require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "should get find" do
    get :find
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
