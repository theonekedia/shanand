class ProfitAndLossesController < ApplicationController
  before_action :set_profit_and_loss, only: [:show, :edit, :update, :destroy]

  # GET /profit_and_losses
  # GET /profit_and_losses.json
  def index
    @profit_and_losses = ProfitAndLoss.all
  end

  # GET /profit_and_losses/1
  # GET /profit_and_losses/1.json
  def show
  @profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
  end

  # GET /profit_and_losses/new
  def new
    @profit_and_loss = ProfitAndLoss.new
  end

  # GET /profit_and_losses/1/edit
  def edit
  end

  # POST /profit_and_losses
  # POST /profit_and_losses.json
  def create
    @profit_and_loss = ProfitAndLoss.new(profit_and_loss_params)

    respond_to do |format|
      if @profit_and_loss.save
        format.html { redirect_to @profit_and_loss, notice: 'Profit and loss was successfully created.' }
        format.json { render :show, status: :created, location: @profit_and_loss }
      else
        format.html { render :new }
        format.json { render json: @profit_and_loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profit_and_losses/1
  # PATCH/PUT /profit_and_losses/1.json
  def update
  @profit_and_loss = ProfitAndLoss.find(params[:nse_script_name])
    respond_to do |format|
      if @profit_and_loss.update(profit_and_loss_params)
        format.html { redirect_to @profit_and_loss, notice: 'Profit and loss was successfully updated.' }
        format.json { render :show, status: :ok, location: @profit_and_loss }
      else
        format.html { render :edit }
        format.json { render json: @profit_and_loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profit_and_losses/1
  # DELETE /profit_and_losses/1.json
  def destroy
    @profit_and_loss.destroy
    respond_to do |format|
      format.html { redirect_to profit_and_losses_url, notice: 'Profit and loss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profit_and_loss
      @profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profit_and_loss_params
      params[:profit_and_loss]
    end
end
