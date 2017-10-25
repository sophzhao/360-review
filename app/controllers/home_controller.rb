class HomeController < ApplicationController

    def index
        AnalysisResult.run_api_analysis
    end
    
end
