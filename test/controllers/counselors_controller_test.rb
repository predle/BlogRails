require 'test_helper'

class CounselorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counselor = counselors(:one)
  end

  test "should get index" do
    get counselors_url, as: :json
    assert_response :success
  end

  test "should create counselor" do
    assert_difference('Counselor.count') do
      post counselors_url, params: { counselor: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show counselor" do
    get counselor_url(@counselor), as: :json
    assert_response :success
  end

  test "should update counselor" do
    patch counselor_url(@counselor), params: { counselor: {  } }, as: :json
    assert_response 200
  end

  test "should destroy counselor" do
    assert_difference('Counselor.count', -1) do
      delete counselor_url(@counselor), as: :json
    end

    assert_response 204
  end
end
