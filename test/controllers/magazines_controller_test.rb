require 'test_helper'

class MagazinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @magazine = magazines(:one)
  end

  test "should get index" do
    get magazines_url, as: :json
    assert_response :success
  end

  test "should create magazine" do
    assert_difference('Magazine.count') do
      post magazines_url, params: { magazine: { author: @magazine.author, file: @magazine.file, name: @magazine.name } }, as: :json
    end

    assert_response 201
  end

  test "should show magazine" do
    get magazine_url(@magazine), as: :json
    assert_response :success
  end

  test "should update magazine" do
    patch magazine_url(@magazine), params: { magazine: { author: @magazine.author, file: @magazine.file, name: @magazine.name } }, as: :json
    assert_response 200
  end

  test "should destroy magazine" do
    assert_difference('Magazine.count', -1) do
      delete magazine_url(@magazine), as: :json
    end

    assert_response 204
  end
end
