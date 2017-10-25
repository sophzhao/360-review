class AnalysisResultsController < ApplicationController
  before_action :set_analysis_result, only: [:show, :edit, :update, :destroy]

  # GET /analysis_results
  # GET /analysis_results.json
  def index
    @analysis_results = AnalysisResult.all
    @positive = AnalysisResult.positive.all
    @negative = AnalysisResult.negative.all
  end

  # GET /analysis_results/1
  # GET /analysis_results/1.json
  def show
    @positive = AnalysisResult.positive.all
    @negative = AnalysisResult.negative.all
  end

  # GET /analysis_results/new
  def new
    @analysis_result = AnalysisResult.new
  end

  # GET /analysis_results/1/edit
  def edit
  end

  # POST /analysis_results
  # POST /analysis_results.json
  def create
    @analysis_result = AnalysisResult.new(analysis_result_params)

    respond_to do |format|
      if @analysis_result.save
        format.html { redirect_to @analysis_result, notice: 'Analysis result was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_result }
      else
        format.html { render :new }
        format.json { render json: @analysis_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_results/1
  # PATCH/PUT /analysis_results/1.json
  def update
    respond_to do |format|
      if @analysis_result.update(analysis_result_params)
        format.html { redirect_to @analysis_result, notice: 'Analysis result was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_result }
      else
        format.html { render :edit }
        format.json { render json: @analysis_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_results/1
  # DELETE /analysis_results/1.json
  def destroy
    @analysis_result.destroy
    respond_to do |format|
      format.html { redirect_to analysis_results_url, notice: 'Analysis result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis_result
      @analysis_result = AnalysisResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_result_params
      params.require(:analysis_result).permit(:sentence_id, :sentiment_label, :sentiment_score)
    end
end
