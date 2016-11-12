require 'test_helper'

class SampleArgumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sample_argument = sample_arguments(:one)
  end

  test "should get index" do
    get sample_arguments_url, as: :json
    assert_response :success
  end

  test "should create sample_argument" do
    assert_difference('SampleArgument.count') do
      post sample_arguments_url, params: { sample_argument: { argument_id: @sample_argument.argument_id, sample_id: @sample_argument.sample_id } }, as: :json
    end

    assert_response 201
  end

  test "should show sample_argument" do
    get sample_argument_url(@sample_argument), as: :json
    assert_response :success
  end

  test "should update sample_argument" do
    patch sample_argument_url(@sample_argument), params: { sample_argument: { argument_id: @sample_argument.argument_id, sample_id: @sample_argument.sample_id } }, as: :json
    assert_response 200
  end

  test "should destroy sample_argument" do
    assert_difference('SampleArgument.count', -1) do
      delete sample_argument_url(@sample_argument), as: :json
    end

    assert_response 204
  end
end
