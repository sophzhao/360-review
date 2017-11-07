class HomeController < ApplicationController

    def index
        # (sentence_id, sentiment_label, sentiment_score) = AnalysisResult.run_api_analysis
        # @new_analysis_result = AnalysisResult.new
        # @new_analysis_result.sentence_id = sentence_id
        # @new_analysis_result.sentiment_label = sentiment_label
        # @new_analysis_result.sentiment_score = sentiment_score

        # @new_analysis_result
        ar = AnalysisResult.new
        ar.run_api_analysis(1)
        @sentiment_score = ar.sentiment_score
        # ar.save!


    end
    
end
