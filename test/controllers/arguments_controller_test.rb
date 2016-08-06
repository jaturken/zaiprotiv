require 'test_helper'

class ArgumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @argument = arguments(:one)
  end

  test "should get index" do
    get arguments_url, as: :json
    assert_response :success
  end

  test "should create argument" do
    assert_difference('Argument.count') do
      post arguments_url, params: { argument: { body: @argument.body, rank: @argument.rank, subject_id: @argument.subject_id, title: @argument.title } }, as: :json
    end

    assert_response 201
  end

  test "should show argument" do
    get argument_url(@argument), as: :json
    assert_response :success
  end

  test "should update argument" do
    patch argument_url(@argument), params: { argument: { body: @argument.body, rank: @argument.rank, subject_id: @argument.subject_id, title: @argument.title } }, as: :json
    assert_response 200
  end

  test "should destroy argument" do
    assert_difference('Argument.count', -1) do
      delete argument_url(@argument), as: :json
    end

    assert_response 204
  end
end
