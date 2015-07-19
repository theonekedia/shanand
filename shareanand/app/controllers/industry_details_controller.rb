class IndustryDetailsController < ApplicationController
  before_action :set_industry_detail, only: [:show, :edit, :update, :destroy]

  # GET /industry_details
  # GET /industry_details.json
  def index
    @industry_details = IndustryDetail.all
  end

  # GET /industry_details/1
  # GET /industry_details/1.json
  def show
  end

  # GET /industry_details/new
  def new
    @industry_detail = IndustryDetail.new
  end

  # GET /industry_details/1/edit
  def edit
  end

  # POST /industry_details
  # POST /industry_details.json
  def create
    @industry_detail = IndustryDetail.new(industry_detail_params)

    respond_to do |format|
      if @industry_detail.save
        format.html { redirect_to @industry_detail, notice: 'Industry detail was successfully created.' }
        format.json { render :show, status: :created, location: @industry_detail }
      else
        format.html { render :new }
        format.json { render json: @industry_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_details/1
  # PATCH/PUT /industry_details/1.json
  def update
    respond_to do |format|
      if @industry_detail.update(industry_detail_params)
        format.html { redirect_to @industry_detail, notice: 'Industry detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @industry_detail }
      else
        format.html { render :edit }
        format.json { render json: @industry_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_details/1
  # DELETE /industry_details/1.json
  def destroy
    @industry_detail.destroy
    respond_to do |format|
      format.html { redirect_to industry_details_url, notice: 'Industry detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_detail
      @industry_detail = IndustryDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industry_detail_params
      params[:industry_detail]
    end
end
