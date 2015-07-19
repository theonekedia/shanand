class FinancialsController < ApplicationController
#		before_update :shift_old_bal_sheet_data
#		before_update :shift_old_data_prft_loss

	def show_balance_sheet
# /balance_sheet/:nse_script_name
		if @industry_group == "FINANCE"
			@balance_sheet = BankBalanceSheet.find_by_nse_script_name(params[:nse_script_name])
		else
			@balance_sheet = BalanceSheet.find_by_nse_script_name(params[:nse_script_name])
		end		  
	end

	def show_profit_loss
	#/profit_and_loss/:nse_script_name
		if @industry_group == "FINANCE"
			@profit_and_loss = BankProfitLoss.find_by_nse_script_name(params[:nse_script_name])
		else
			@profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
		end		  
	end

	def edit
		#if @industry_group == "FINANCE"
		industry=ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name]).industry
		case industry
		when "BANKS - PUBLIC SECTOR", "BANKS - PRIVATE SECTOR", "FINANCE - INVESTMENTS", "FINANCE - GENERAL", "FINANCE - HOUSING", "FINANCE - LEASING & HIRE PURCHASE","FINANCE - TERM LENDING INSTITUTIONS"
			@profit_and_loss = BankProfitLoss.find_by_nse_script_name(params[:nse_script_name])
			@balance_sheet = BankBalanceSheet.find_by_nse_script_name(params[:nse_script_name])
		else
			@balance_sheet = BalanceSheet.find_by_nse_script_name(params[:nse_script_name])
			@profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
		end
	end

	def update
		if @industry_group == "FINANCE"
			@profit_and_loss = BankProfitLoss.find_by_nse_script_name(params[:nse_script_name])
			@balance_sheet = BankBalanceSheet.find_by_nse_script_name(params[:nse_script_name])
		else
			@balance_sheet = BalanceSheet.find_by_nse_script_name(params[:nse_script_name])
			@profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
		end

		respond_to do |format|
      		if @balance_sheet.update(params[:balance_sheet]) && @profit_and_loss.update(params[:profit_and_loss])
      			format.html { redirect_to @balance_sheet, notice: 'Balance sheet was successfully updated.' }
        		format.html { redirect_to @profit_and_loss, notice: 'Profit and loss was successfully updated.' }
        		format.json { render :show_balance_sheet, status: :ok, location: @balance_sheet }
        		format.json { render :show_profit_loss, status: :ok, location: @profit_and_loss }
      		else
        		format.html { render :edit }
        		format.json { render json: @balance_sheet.errors, status: :unprocessable_entity }
      		end
    	end
	end

























	private

	@industry_group = def sector
		industry=ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name]).industry
		case industry
		when "BANKS - PUBLIC SECTOR", "BANKS - PRIVATE SECTOR", "FINANCE - INVESTMENTS", "FINANCE - GENERAL", "FINANCE - HOUSING", "FINANCE - LEASING & HIRE PURCHASE","FINANCE - TERM LENDING INSTITUTIONS"
			return "FINANCE"		
		else
			return "OTHER"
		end
	end

def shift_old_bal_sheet_data
if @industry_group == "FINANCE"


else
BalanceSheet.find_by_nse_script_name(params[:nse_script_name]).update(  
   tot_shr_cap_4 = tot_shr_cap_3,
   tot_shr_cap_3 = tot_shr_cap_2,
   tot_shr_cap_2 = tot_shr_cap_1,
   tot_shr_cap_1 = tot_shr_cap_0,
   eq_shr_cap_4 = eq_shr_cap_3,
   eq_shr_cap_3 = eq_shr_cap_2,
   eq_shr_cap_2 = eq_shr_cap_1,
   eq_shr_cap_1 = eq_shr_cap_0,
   shr_appl_mny_4 = shr_appl_mny_3,
   shr_appl_mny_3 = shr_appl_mny_2,
   shr_appl_mny_2 = shr_appl_mny_1,
   shr_appl_mny_1 = shr_appl_mny_0,

   pre_shr_cap_4 = pre_shr_cap_3,
   pre_shr_cap_3 = pre_shr_cap_2,
   pre_shr_cap_2 = pre_shr_cap_1,
   pre_shr_cap_1 = pre_shr_cap_0,

   reserves_4 = reserves_3,
   reserves_3 = reserves_2,
   reserves_2 = reserves_1,
   reserves_1 = reserves_0,

   networth_4 = networth_3,
   networth_3 = networth_2,
   networth_2 = networth_1,
   networth_1 = networth_0,

   scrd_lons_4 = scrd_lons_3,
   scrd_lons_3 = scrd_lons_2,
   scrd_lons_2 = scrd_lons_1,
   scrd_lons_1 = scrd_lons_0,

   unscrd_lons_4 = unscrd_lons_3,
   unscrd_lons_3 = unscrd_lons_2,
   unscrd_lons_2 = unscrd_lons_1,
   unscrd_lons_1 = unscrd_lons_0,

   tot_debt_4 = tot_debt_3,
   tot_debt_3 = tot_debt_2,
   tot_debt_2 = tot_debt_1,
   tot_debt_1 = tot_debt_0,

   tot_liabs_4 = tot_liabs_3,
   tot_liabs_3 = tot_liabs_2,
   tot_liabs_2 = tot_liabs_1,
   tot_liabs_1 = tot_liabs_0,

   gros_block_4 = gros_block_3,
   gros_block_3 = gros_block_2,
   gros_block_2 = gros_block_1,
   gros_block_1 = gros_block_0,

   reval_rsrvs_4 = reval_rsrvs_3,
   reval_rsrvs_3 = reval_rsrvs_2,
   reval_rsrvs_2 = reval_rsrvs_1,
   reval_rsrvs_1 = reval_rsrvs_0,

   accm_deprec_4 = accm_deprec_3,
   accm_deprec_3 = accm_deprec_2,
   accm_deprec_2 = accm_deprec_1,
   accm_deprec_1 = accm_deprec_0,

   net_block_4 = net_block_3,
   net_block_3 = net_block_2,
   net_block_2 = net_block_1,
   net_block_1 = net_block_0,

   cap_wip_4 = cap_wip_3,
   cap_wip_3 = cap_wip_2,
   cap_wip_2 = cap_wip_1,
   cap_wip_1 = cap_wip_0,

   invstmnts_4 = invstmnts_3,
   invstmnts_3 = invstmnts_2,
   invstmnts_2 = invstmnts_1,
   invstmnts_1 = invstmnts_0,

   inventory_4 = inventory_3,
   inventory_3 = inventory_2,
   inventory_2 = inventory_1,
   inventory_1 = inventory_0,

   sndr_debts_4 = sndr_debts_3,
   sndr_debts_3 = sndr_debts_2,
   sndr_debts_2 = sndr_debts_1,
   sndr_debts_1 = sndr_debts_0,

   c_b_bal_4 = c_b_bal_3,
   c_b_bal_3 = c_b_bal_2,
   c_b_bal_2 = c_b_bal_1,
   c_b_bal_1 = c_b_bal_0,

   tot_curr_assets_4 =  tot_curr_assets_3,
   tot_curr_assets_3 =  tot_curr_assets_2,
   tot_curr_assets_2 =  tot_curr_assets_1,
   tot_curr_assets_1 =  tot_curr_assets_0,

   loans_addv_4 = loans_addv_3,
   loans_addv_3 = loans_addv_2,
   loans_addv_2 = loans_addv_1,
   loans_addv_1 = loans_addv_0,

   fixd_deps_4 = fixd_deps_3,
   fixd_deps_3 = fixd_deps_2,
   fixd_deps_2 = fixd_deps_1,
   fixd_deps_1 = fixd_deps_0,

   tot_ca_loans_adv_4 = tot_ca_loans_adv_3,
   tot_ca_loans_adv_3 = tot_ca_loans_adv_2,
   tot_ca_loans_adv_2 = tot_ca_loans_adv_1,
   tot_ca_loans_adv_1 = tot_ca_loans_adv_0,

   defrd_cr_4 = defrd_cr_3,
   defrd_cr_3 = defrd_cr_2,
   defrd_cr_2 = defrd_cr_1,
   defrd_cr_1 = defrd_cr_0,

   curr_liabs_4 = curr_liabs_3,
   curr_liabs_3 = curr_liabs_2,
   curr_liabs_2 = curr_liabs_1,
   curr_liabs_1 = curr_liabs_0,

   provisions_4 = provisions_3,
   provisions_3 = provisions_2,
   provisions_2 = provisions_1,
   provisions_1 = provisions_0,

   tot_cl_provs_4 = tot_cl_provs_3,
   tot_cl_provs_3 = tot_cl_provs_2,
   tot_cl_provs_2 = tot_cl_provs_1,
   tot_cl_provs_1 = tot_cl_provs_0,

   net_curr_assets_4 = net_curr_assets_3,
   net_curr_assets_3 = net_curr_assets_2,
   net_curr_assets_2 = net_curr_assets_1,
   net_curr_assets_1 = net_curr_assets_0,

   misc_expen_4 = misc_expen_3,
   misc_expen_3 = misc_expen_2,
   misc_expen_2 = misc_expen_1,
   misc_expen_1 = misc_expen_0,

   tot_assets_4 = tot_assets_3,
   tot_assets_3 = tot_assets_2,
   tot_assets_2 = tot_assets_1,
   tot_assets_1 = tot_assets_0,

   contignt_liabs_4 = contignt_liabs_3,
   contignt_liabs_3 = contignt_liabs_2,
   contignt_liabs_2 = contignt_liabs_1,
   contignt_liabs_1 = contignt_liabs_0,

   bk_val_4 = bk_val_3,
   bk_val_3 = bk_val_2,
   bk_val_2 = bk_val_1,
   bk_val_1 = bk_val_0
)

end
end


def shift_old_data_prft_loss

if @industry_group == "FINANCE"


else
@profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name]).update(
   sal_turnovr_4 = sal_turnovr_3,
   sal_turnovr_3 = sal_turnovr_2,
   sal_turnovr_2 = sal_turnovr_1,
   sal_turnovr_1 = sal_turnovr_0,
   excs_duty_4 = excs_duty_3,
   excs_duty_3 = excs_duty_2,
   excs_duty_2 = excs_duty_1,
   excs_duty_1 = excs_duty_0,
  
   net_sales_4 = net_sales_3,
   net_sales_3 = net_sales_2,
   net_sales_2 = net_sales_1,
   net_sales_1 = net_sales_0,

   other_income_4 = other_income_3,  
   other_income_3 = other_income_2,
   other_income_2 = other_income_1,
   other_income_1 = other_income_0,

   stck_adjst_4 = stck_adjst_3,
   stck_adjst_3 = stck_adjst_2,
   stck_adjst_2 = stck_adjst_1,
   stck_adjst_1 = stck_adjst_0,

   tot_income_4 = tot_income_3,
   tot_income_3 = tot_income_2,
   tot_income_2 = tot_income_1,
   tot_income_1 = tot_income_0,

   raw_matrls_4 = raw_matrls_3,
   raw_matrls_3 = raw_matrls_2,
   raw_matrls_2 = raw_matrls_1,
   raw_matrls_1 = raw_matrls_0,

   pwr_fuel_cst_4 = pwr_fuel_cst_3,
   pwr_fuel_cst_3 = pwr_fuel_cst_2,
   pwr_fuel_cst_2 = pwr_fuel_cst_1,
   pwr_fuel_cst_1 = pwr_fuel_cst_0,

   exmploy_cst_4 = exmploy_cst_3,
   exmploy_cst_3 = exmploy_cst_2,
   exmploy_cst_2 = exmploy_cst_1,
   exmploy_cst_1 = exmploy_cst_0,

   othr_manufctr_exp_4 = othr_manufctr_exp_3,
   othr_manufctr_exp_3 = othr_manufctr_exp_2,
   othr_manufctr_exp_2 = othr_manufctr_exp_1,
   othr_manufctr_exp_1 = othr_manufctr_exp_0,

   selling_admin_exp_4 = selling_admin_exp_3,
   selling_admin_exp_3 = selling_admin_exp_2,
   selling_admin_exp_2 = selling_admin_exp_1,
   selling_admin_exp_1 = selling_admin_exp_0,

   misc_exp_4 = misc_exp_3,
   misc_exp_3 = misc_exp_2,
   misc_exp_2 = misc_exp_1,
   misc_exp_1 = misc_exp_0,

   preoperative_exp_cap_4 = preoperative_exp_cap_3,
   preoperative_exp_cap_3 = preoperative_exp_cap_2,
   preoperative_exp_cap_2 = preoperative_exp_cap_1,
   preoperative_exp_cap_1 = preoperative_exp_cap_0,

   tot_exp_4 = tot_exp_3,
   tot_exp_3 = tot_exp_2,
   tot_exp_2 = tot_exp_1,
   tot_exp_1 = tot_exp_0,

   opertng_prft_4 = opertng_prft_3,
   opertng_prft_3 = opertng_prft_2,
   opertng_prft_2 = opertng_prft_1,
   opertng_prft_1 = opertng_prft_0,

   pbdit_4 = pbdit_3,
   pbdit_3 = pbdit_2,
   pbdit_2 = pbdit_1,
   pbdit_1 = pbdit_0,

   interest_4 = interest_3,
   interest_3 = interest_2,
   interest_2 = interest_1,
   interest_1 = interest_0,

   pbdt_4 = pbdt_3,
   pbdt_3 = pbdt_2,
   pbdt_2 = pbdt_1,
   pbdt_1 = pbdt_0,

   deprec_4 = deprec_3,
   deprec_3 = deprec_2,
   deprec_2 = deprec_1,
   deprec_1 = deprec_0,

   othr_writn_off_4 = othr_writn_off_3,
   othr_writn_off_3 = othr_writn_off_2,
   othr_writn_off_2 = othr_writn_off_1,
   othr_writn_off_1 = othr_writn_off_0,

   pbt_4 = pbt_3,
   pbt_3 = pbt_2,
   pbt_2 = pbt_1,
   pbt_1 = pbt_0,

   extr_ord_itms_4 = extr_ord_itms_3,
   extr_ord_itms_3 = extr_ord_itms_2,
   extr_ord_itms_2 = extr_ord_itms_1,
   extr_ord_itms_1 = extr_ord_itms_0,

   post_pbt_4 = post_pbt_3,
   post_pbt_3 = post_pbt_2,
   post_pbt_2 = post_pbt_1,
   post_pbt_1 = post_pbt_0,

   tax_4 = tax_3,
   tax_3 = tax_2,
   tax_2 = tax_1,
   tax_1 = tax_0,

   repo_net_prft_4 = repo_net_prft_3,
   repo_net_prft_3 = repo_net_prft_2,
   repo_net_prft_2 = repo_net_prft_1,
   repo_net_prft_1 = repo_net_prft_0,

   tot_val_adtn_4 = tot_val_adtn_3,
   tot_val_adtn_3 = tot_val_adtn_2,
   tot_val_adtn_2 = tot_val_adtn_1,
   tot_val_adtn_1 = tot_val_adtn_0,

   pref_dvdnd_4 = pref_dvdnd_3,
   pref_dvdnd_3 = pref_dvdnd_2,
   pref_dvdnd_2 = pref_dvdnd_1,
   pref_dvdnd_1 = pref_dvdnd_0,

   equ_dvdnd_4 = equ_dvdnd_3,
   equ_dvdnd_3 = equ_dvdnd_2,
   equ_dvdnd_2 = equ_dvdnd_1,
   equ_dvdnd_1 = equ_dvdnd_0,

   co_div_tax_4 = co_div_tax_3,
   co_div_tax_3 = co_div_tax_2,
   co_div_tax_2 = co_div_tax_1,
   co_div_tax_1 = co_div_tax_0,

   no_shares_issued_4 = no_shares_issued_3,
   no_shares_issued_3 = no_shares_issued_2,
   no_shares_issued_2 = no_shares_issued_1,
   no_shares_issued_1 = no_shares_issued_0,

   eps_4 = eps_3,
   eps_3 = eps_2,
   eps_2 = eps_1,
   eps_1 = eps_0,

   eqt_divdnd_perc_4 = eqt_divdnd_perc_3,
   eqt_divdnd_perc_3 = eqt_divdnd_perc_2,
   eqt_divdnd_perc_2 = eqt_divdnd_perc_1,
   eqt_divdnd_perc_1 = eqt_divdnd_perc_0,

   bk_val_4 =  bk_val_3,
   bk_val_3 =  bk_val_2,
   bk_val_2 =  bk_val_1,
   bk_val_1 =  bk_val_0
 )  

end
end


end