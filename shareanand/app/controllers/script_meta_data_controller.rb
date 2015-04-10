class ScriptMetaDataController < ApplicationController
  before_action :set_script_meta_datum, only: [:show, :edit, :update, :destroy]

  # GET /script_meta_data
  # GET /script_meta_data.json
  def index
    @script_meta_data = ScriptMetaDatum.all
  end

  # GET /script_meta_data/1
  # GET /script_meta_data/1.json
  def show
	@script_meta_datum = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
  end

  # GET /script_meta_data/new
  def new
    @script_meta_datum = ScriptMetaDatum.new
  end

  # GET /script_meta_data/1/edit
  def edit
	@script_meta_datum = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
  end

  # POST /script_meta_data
  # POST /script_meta_data.json
  def create
    @script_meta_datum = ScriptMetaDatum.new(script_meta_datum_params)

    respond_to do |format|
      if @script_meta_datum.save
        format.html { redirect_to @script_meta_datum, notice: 'New script has been added successfully.' }
        format.json { render :show, status: :created, location: @script_meta_datum }
      else
        format.html { render :new }
        format.json { render json: @script_meta_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /script_meta_data/1
  # PATCH/PUT /script_meta_data/1.json
  def update
  @script_meta_datum = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
    respond_to do |format|
      if @script_meta_datum.update_attributes(script_meta_datum_params)
        format.html { redirect_to @script_meta_datum, notice: 'Script data has been successfully updated.' }
        format.json { render :show, status: :ok, location: @script_meta_datum }
      else
        format.html { render :edit }
        format.json { render json: @script_meta_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /script_meta_data/1
  # DELETE /script_meta_data/1.json
  def destroy
    @script_meta_datum.destroy
    respond_to do |format|
      format.html { redirect_to script_meta_data_url, notice: 'Script data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script_meta_datum
      @script_meta_datum = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def script_meta_datum_params
      params[:script_meta_datum].permit(:isi_num, :bse_script_numb, :nse_script_name, :money_control_script_name, :industry)
    end
end