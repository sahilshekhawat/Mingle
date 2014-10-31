require 'test_helper'

class CycleIssuRequestsControllerTest < ActionController::TestCase
  setup do
    @cycle_issu_request = cycle_issu_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cycle_issu_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cycle_issu_request" do
    assert_difference('CycleIssuRequest.count') do
      post :create, cycle_issu_request: { cycleid: @cycle_issu_request.cycleid, from: @cycle_issu_request.from, studentid: @cycle_issu_request.studentid, to: @cycle_issu_request.to }
    end

    assert_redirected_to cycle_issu_request_path(assigns(:cycle_issu_request))
  end

  test "should show cycle_issu_request" do
    get :show, id: @cycle_issu_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cycle_issu_request
    assert_response :success
  end

  test "should update cycle_issu_request" do
    patch :update, id: @cycle_issu_request, cycle_issu_request: { cycleid: @cycle_issu_request.cycleid, from: @cycle_issu_request.from, studentid: @cycle_issu_request.studentid, to: @cycle_issu_request.to }
    assert_redirected_to cycle_issu_request_path(assigns(:cycle_issu_request))
  end

  test "should destroy cycle_issu_request" do
    assert_difference('CycleIssuRequest.count', -1) do
      delete :destroy, id: @cycle_issu_request
    end

    assert_redirected_to cycle_issu_requests_path
  end
end
