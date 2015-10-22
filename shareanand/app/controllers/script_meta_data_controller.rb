class ScriptMetaDataController < ApplicationController
  before_action :set_script_meta_datum, only: [:show, :edit, :update, :destroy]

  # GET /script_meta_data
  # GET /script_meta_data.json
  def index
=begin
    per_page = 40
    page = params[:page]
 #   @sorting = sorting?
    if @sorting
      per_page *= (page || 1).to_i
      page = 1
    end
    @script_meta_data = ScriptMetaDatum.paginate :page => page,
      :per_page => per_page,
      #:include => [:profile],
  #    :order => sort_order.blank? ? 'created_at desc' : sort_order
  end
=end
  @script_meta_data = ScriptMetaDatum.paginate(page: params[:page], per_page: 30)
  end

  # GET /script_meta_data/1
  # GET /script_meta_data/1.json

  def no_of_shares
    @script_meta_data = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
    #@num_of_shares = script_meta_data.number_of_shares
    @script_meta_data.update_attributes(script_meta_datum_params)
    #ScriptMetaDatum.update(params[:nse_script_name], params[:]

  end

  def search
    @company_list= ScriptMetaDatum.uniq.pluck(:nse_script_name)
  end
    
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
