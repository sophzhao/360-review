require 'test_helper'

class AnalysisResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis_result = analysis_results(:one)
  end

  test "should get index" do
    get analysis_results_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_result_url
    assert_response :success
  end

  test "should create analysis_result" do
    assert_difference('AnalysisResult.count') do
      post analysis_results_url, params: { analysis_result: { sentence_id: @analysis_result.sentence_id, sentiment_label: @analysis_result.sentiment_label, sentiment_score: @analysis_result.sentiment_score } }
    end

    assert_redirected_to analysis_result_url(AnalysisResult.last)
  end

  test "should show analysis_result" do
    get analysis_result_url(@analysis_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_result_url(@analysis_result)
    assert_response :success
  end

  test "should update analysis_result" do
    patch analysis_result_url(@analysis_result), params: { analysis_result: { sentence_id: @analysis_result.sentence_id, sentiment_label: @analysis_result.sentiment_label, sentiment_score: @analysis_result.sentiment_score } }
    assert_redirected_to analysis_result_url(@analysis_result)
  end

  test "should destroy analysis_result" do
    assert_difference('AnalysisResult.count', -1) do
      delete analysis_result_url(@analysis_result)
    end

    assert_redirected_to analysis_results_url
  end
end
