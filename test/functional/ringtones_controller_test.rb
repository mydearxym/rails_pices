require 'test_helper'

class RingtonesControllerTest < ActionController::TestCase
  setup do
    @ringtone = ringtones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ringtones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ringtone" do
    assert_difference('Ringtone.count') do
      post :create, ringtone: { name: @ringtone.name, tag: @ringtone.tag }
    end

    assert_redirected_to ringtone_path(assigns(:ringtone))
  end

  test "should show ringtone" do
    get :show, id: @ringtone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ringtone
    assert_response :success
  end

  test "should update ringtone" do
    put :update, id: @ringtone, ringtone: { name: @ringtone.name, tag: @ringtone.tag }
    assert_redirected_to ringtone_path(assigns(:ringtone))
  end

  test "should destroy ringtone" do
    assert_difference('Ringtone.count', -1) do
      delete :destroy, id: @ringtone
    end

    assert_redirected_to ringtones_path
  end
end
