class DayTradingsController < ApplicationController
  before_action :set_day_trading, only: [:show, :edit, :update, :destroy]
    helper_method :sort_column, :sort_direction

  # GET /day_tradings
  # GET /day_tradings.json
  def index
    @day_tradings = DayTrading.order(sort_column + " " + sort_direction)
  end

  # GET /day_tradings/1
  # GET /day_tradings/1.json
  def show
  end

  # GET /day_tradings/new
  def new
    @day_trading = DayTrading.new
  end

  # GET /day_tradings/1/edit
  def edit
  end

  # POST /day_tradings
  # POST /day_tradings.json
  def create
    @day_trading = DayTrading.new(day_trading_params)

    respond_to do |format|
      if @day_trading.save
        format.html { redirect_to @day_trading, notice: 'Day trading was successfully created.' }
        format.json { render :show, status: :created, location: @day_trading }
      else
        format.html { render :new }
        format.json { render json: @day_trading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /day_tradings/1
  # PATCH/PUT /day_tradings/1.json
  def update
    respond_to do |format|
      if @day_trading.update(day_trading_params)
        format.html { redirect_to @day_trading, notice: 'Day trading was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_trading }
      else
        format.html { render :edit }
        format.json { render json: @day_trading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_tradings/1
  # DELETE /day_tradings/1.json
  def destroy
    @day_trading.destroy
    respond_to do |format|
      format.html { redirect_to day_tradings_url, notice: 'Day trading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_trading
      @day_trading = DayTrading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_trading_params
      params[:day_trading]
    end
     def sort_column
    DayTrading.column_names.include?(params[:sort]) ? params[:sort] : "nse_script_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
