class RiskAndReturnsController < ApplicationController
  before_action :set_risk_and_return, only: [:show, :edit, :update, :destroy]

  # GET /risk_and_returns
  # GET /risk_and_returns.json
  def index
    @risk_and_returns = RiskAndReturn.all
  end

  # GET /risk_and_returns/1
  # GET /risk_and_returns/1.json
  def show
  end

  # GET /risk_and_returns/new
  def new
    @risk_and_return = RiskAndReturn.new
  end

  # GET /risk_and_returns/1/edit
  def edit
  end

  # POST /risk_and_returns
  # POST /risk_and_returns.json
  def create
    @risk_and_return = RiskAndReturn.new(risk_and_return_params)

    respond_to do |format|
      if @risk_and_return.save
        format.html { redirect_to @risk_and_return, notice: 'Risk and return was successfully created.' }
        format.json { render :show, status: :created, location: @risk_and_return }
      else
        format.html { render :new }
        format.json { render json: @risk_and_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risk_and_returns/1
  # PATCH/PUT /risk_and_returns/1.json
  def update
    respond_to do |format|
      if @risk_and_return.update(risk_and_return_params)
        format.html { redirect_to @risk_and_return, notice: 'Risk and return was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk_and_return }
      else
        format.html { render :edit }
        format.json { render json: @risk_and_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_and_returns/1
  # DELETE /risk_and_returns/1.json
  def destroy
    @risk_and_return.destroy
    respond_to do |format|
      format.html { redirect_to risk_and_returns_url, notice: 'Risk and return was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk_and_return
      @risk_and_return = RiskAndReturn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_and_return_params
      params[:risk_and_return]
    end
end
