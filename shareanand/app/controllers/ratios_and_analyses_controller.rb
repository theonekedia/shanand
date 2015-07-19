class RatiosAndAnalysesController < ApplicationController
  before_action :set_ratios_and_analysis, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  # GET /ratios_and_analyses
  # GET /ratios_and_analyses.json
  def index
    @ratios_and_analyses = RatiosAndAnalysis.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 30)
  end

  # GET /ratios_and_analyses/1
  # GET /ratios_and_analyses/1.json
  def show
	@ratios_and_analysis = RatiosAndAnalysis.find_by_nse_script_name(params[:nse_script_name])
	@gpm_chart=line_chart('Gross Profit Margin',@ratios_and_analysis.gross_profit_margin_0,@ratios_and_analysis.gross_profit_margin_1,@ratios_and_analysis.gross_profit_margin_2,@ratios_and_analysis.gross_profit_margin_3,@ratios_and_analysis.gross_profit_margin_4,'Profitable Ratios- GPM')
	@opm_chart=line_chart('Operating Profit Margin',@ratios_and_analysis.oper_profit_margn_0,@ratios_and_analysis.oper_profit_margn_1,@ratios_and_analysis.oper_profit_margn_2,@ratios_and_analysis.oper_profit_margn_3,@ratios_and_analysis.oper_profit_margn_4,'Profitable Ratios- OPM')
	@npm_chart=line_chart('Net Profit Margin',@ratios_and_analysis.net_proft_margn_0,@ratios_and_analysis.net_proft_margn_1,@ratios_and_analysis.net_proft_margn_2,@ratios_and_analysis.net_proft_margn_3,@ratios_and_analysis.net_proft_margn_4,'Profitable Ratios- NPM')
  end

  # GET /ratios_and_analyses/new
  def new
    @ratios_and_analysis = RatiosAndAnalysis.new
  end

  # GET /ratios_and_analyses/1/edit
  def edit
  end

  # POST /ratios_and_analyses
  # POST /ratios_and_analyses.json
  def create
    @ratios_and_analysis = RatiosAndAnalysis.new(ratios_and_analysis_params)

    respond_to do |format|
      if @ratios_and_analysis.save
        format.html { redirect_to @ratios_and_analysis, notice: 'Ratios and analysis was successfully created.' }
        format.json { render :show, status: :created, location: @ratios_and_analysis }
      else
        format.html { render :new }
        format.json { render json: @ratios_and_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratios_and_analyses/1
  # PATCH/PUT /ratios_and_analyses/1.json
  def update
    respond_to do |format|
      if @ratios_and_analysis.update(ratios_and_analysis_params)
        format.html { redirect_to @ratios_and_analysis, notice: 'Ratios and analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @ratios_and_analysis }
      else
        format.html { render :edit }
        format.json { render json: @ratios_and_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratios_and_analyses/1
  # DELETE /ratios_and_analyses/1.json
  def destroy
    @ratios_and_analysis.destroy
    respond_to do |format|
      format.html { redirect_to ratios_and_analyses_url, notice: 'Ratios and analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ratios_and_analysis
      @ratios_and_analysis = RatiosAndAnalysis.find_by_nse_script_name(params[:nse_script_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ratios_and_analysis_params
      params[:ratios_and_analysis]
    end
    
    def sort_column
    RatiosAndAnalysis.column_names.include?(params[:sort]) ? params[:sort] : "nse_script_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def line_chart(title,cur_yr,cur_yr_1,cur_yr_2,cur_yr_3,cur_yr_4,heading)
  data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', title)
    data_table.add_rows(5)
    data_table.set_cell(0, 0, '2010')
    data_table.set_cell(0, 1, cur_yr_4)
    
    data_table.set_cell(1, 0, '2011')
    data_table.set_cell(1, 1, cur_yr_3)

    data_table.set_cell(2, 0, '2012')
    data_table.set_cell(2, 1, cur_yr_2)
    
    data_table.set_cell(3, 0, '2013')
    data_table.set_cell(3, 1, cur_yr_1)
    
    data_table.set_cell(4, 0, '2014')
    data_table.set_cell(4, 1, cur_yr)
    
    opts   = { :width => 500, :height => 300, :title => heading, :legend => 'bottom' }
    @chart= GoogleVisualr::Interactive::LineChart.new(data_table, opts)
    #return @chart
    end
  
end
