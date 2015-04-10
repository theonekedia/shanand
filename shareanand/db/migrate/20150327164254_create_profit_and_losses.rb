class CreateProfitAndLosses < ActiveRecord::Migration
  def change
    create_table :profit_and_losses do |t|
		t.string	:industry
		t.string	:isi_num,	null: false 
		t.string	:nse_script_name, null: false 
		t.boolean	:cur_yr_updated

		t.decimal	:sal_turnovr_0,	  precision: 10, scale: 2
		t.decimal	:sal_turnovr_1,	  precision: 10, scale: 2
		t.decimal	:sal_turnovr_2,	  precision: 10, scale: 2
		t.decimal	:sal_turnovr_3,	  precision: 10, scale: 2
		t.decimal	:sal_turnovr_4,	  precision: 10, scale: 2
		
		t.decimal	:excs_duty_0,	  precision: 10, scale: 2
		t.decimal	:excs_duty_1,	  precision: 10, scale: 2
		t.decimal	:excs_duty_2,	  precision: 10, scale: 2
		t.decimal	:excs_duty_3,	  precision: 10, scale: 2
		t.decimal	:excs_duty_4,	  precision: 10, scale: 2
		
		t.decimal	:net_sales_0,	  precision: 10, scale: 2
		t.decimal	:net_sales_1,	  precision: 10, scale: 2
		t.decimal	:net_sales_2,	  precision: 10, scale: 2
		t.decimal	:net_sales_3,	  precision: 10, scale: 2
		t.decimal	:net_sales_4,	  precision: 10, scale: 2
		
		t.decimal	:other_income_0,	  precision: 10, scale: 2
		t.decimal	:other_income_1,	  precision: 10, scale: 2
		t.decimal	:other_income_2,	  precision: 10, scale: 2
		t.decimal	:other_income_3,	  precision: 10, scale: 2
		t.decimal	:other_income_4,	  precision: 10, scale: 2
		
		t.decimal	:stck_adjst_0,	  precision: 10, scale: 2
		t.decimal	:stck_adjst_1,	  precision: 10, scale: 2
		t.decimal	:stck_adjst_2,	  precision: 10, scale: 2
		t.decimal	:stck_adjst_3,	  precision: 10, scale: 2
		t.decimal	:stck_adjst_4,	  precision: 10, scale: 2
		
		t.decimal	:tot_income_0,	  precision: 10, scale: 2
		t.decimal	:tot_income_1,	  precision: 10, scale: 2
		t.decimal	:tot_income_2,	  precision: 10, scale: 2
		t.decimal	:tot_income_3,	  precision: 10, scale: 2
		t.decimal	:tot_income_4,	  precision: 10, scale: 2
		
		t.decimal	:raw_matrls_0,	  precision: 10, scale: 2
		t.decimal	:raw_matrls_1,	  precision: 10, scale: 2
		t.decimal	:raw_matrls_2,	  precision: 10, scale: 2
		t.decimal	:raw_matrls_3,	  precision: 10, scale: 2
		t.decimal	:raw_matrls_4,	  precision: 10, scale: 2
		
		t.decimal	:pwr_fuel_cst_0,	  precision: 10, scale: 2
		t.decimal	:pwr_fuel_cst_1,	  precision: 10, scale: 2
		t.decimal	:pwr_fuel_cst_2,	  precision: 10, scale: 2
		t.decimal	:pwr_fuel_cst_3,	  precision: 10, scale: 2
		t.decimal	:pwr_fuel_cst_4,	  precision: 10, scale: 2
		
		t.decimal	:exmploy_cst_0,	  precision: 10, scale: 2
		t.decimal	:exmploy_cst_1,	  precision: 10, scale: 2
		t.decimal	:exmploy_cst_2,	  precision: 10, scale: 2
		t.decimal	:exmploy_cst_3,	  precision: 10, scale: 2
		t.decimal	:exmploy_cst_4,	  precision: 10, scale: 2
		
		t.decimal	:othr_manufctr_exp_0,	  precision: 10, scale: 2
		t.decimal	:othr_manufctr_exp_1,	  precision: 10, scale: 2
		t.decimal	:othr_manufctr_exp_2,	  precision: 10, scale: 2
		t.decimal	:othr_manufctr_exp_3,	  precision: 10, scale: 2
		t.decimal	:othr_manufctr_exp_4,	  precision: 10, scale: 2
		
		t.decimal	:selling_admin_exp_0,	  precision: 10, scale: 2
		t.decimal	:selling_admin_exp_1,	  precision: 10, scale: 2
		t.decimal	:selling_admin_exp_2,	  precision: 10, scale: 2
		t.decimal	:selling_admin_exp_3,	  precision: 10, scale: 2
		t.decimal	:selling_admin_exp_4,	  precision: 10, scale: 2
		
		t.decimal	:misc_exp_0,	  precision: 10, scale: 2
		t.decimal	:misc_exp_1,	  precision: 10, scale: 2
		t.decimal	:misc_exp_2,	  precision: 10, scale: 2
		t.decimal	:misc_exp_3,	  precision: 10, scale: 2
		t.decimal	:misc_exp_4,	  precision: 10, scale: 2

		t.decimal	:preoperative_exp_cap_0,	  precision: 10, scale: 2
		t.decimal	:preoperative_exp_cap_1,	  precision: 10, scale: 2
		t.decimal	:preoperative_exp_cap_2,	  precision: 10, scale: 2
		t.decimal	:preoperative_exp_cap_3,	  precision: 10, scale: 2
		t.decimal	:preoperative_exp_cap_4,	  precision: 10, scale: 2
		
		t.decimal	:tot_exp_0,	  precision: 10, scale: 2
		t.decimal	:tot_exp_1,	  precision: 10, scale: 2
		t.decimal	:tot_exp_2,	  precision: 10, scale: 2
		t.decimal	:tot_exp_3,	  precision: 10, scale: 2
		t.decimal	:tot_exp_4,	  precision: 10, scale: 2
		
		t.decimal	:opertng_prft_0,	  precision: 10, scale: 2
		t.decimal	:opertng_prft_1,	  precision: 10, scale: 2
		t.decimal	:opertng_prft_2,	  precision: 10, scale: 2
		t.decimal	:opertng_prft_3,	  precision: 10, scale: 2
		t.decimal	:opertng_prft_4,	  precision: 10, scale: 2
		
		t.decimal	:pbdit_0,	  precision: 10, scale: 2
		t.decimal	:pbdit_1,	  precision: 10, scale: 2
		t.decimal	:pbdit_2,	  precision: 10, scale: 2
		t.decimal	:pbdit_3,	  precision: 10, scale: 2
		t.decimal	:pbdit_4,	  precision: 10, scale: 2

		t.decimal	:interest_0,	  precision: 10, scale: 2
		t.decimal	:interest_1,	  precision: 10, scale: 2
		t.decimal	:interest_2,	  precision: 10, scale: 2
		t.decimal	:interest_3,	  precision: 10, scale: 2
		t.decimal	:interest_4,	  precision: 10, scale: 2
		
		t.decimal	:pbdt_0,	  precision: 10, scale: 2
		t.decimal	:pbdt_1,	  precision: 10, scale: 2
		t.decimal	:pbdt_2,	  precision: 10, scale: 2
		t.decimal	:pbdt_3,	  precision: 10, scale: 2
		t.decimal	:pbdt_4,	  precision: 10, scale: 2
		
		t.decimal	:deprec_0,	  precision: 10, scale: 2
		t.decimal	:deprec_1,	  precision: 10, scale: 2
		t.decimal	:deprec_2,	  precision: 10, scale: 2
		t.decimal	:deprec_3,	  precision: 10, scale: 2
		t.decimal	:deprec_4,	  precision: 10, scale: 2
		
		t.decimal	:othr_writn_off_0,	  precision: 10, scale: 2
		t.decimal	:othr_writn_off_1,	  precision: 10, scale: 2
		t.decimal	:othr_writn_off_2,	  precision: 10, scale: 2
		t.decimal	:othr_writn_off_3,	  precision: 10, scale: 2
		t.decimal	:othr_writn_off_4,	  precision: 10, scale: 2
		
		t.decimal	:pbt_0,	  precision: 10, scale: 2
		t.decimal	:pbt_1,	  precision: 10, scale: 2
		t.decimal	:pbt_2,	  precision: 10, scale: 2
		t.decimal	:pbt_3,	  precision: 10, scale: 2
		t.decimal	:pbt_4,	  precision: 10, scale: 2
		
		t.decimal	:extr_ord_itms_0,	  precision: 10, scale: 2
		t.decimal	:extr_ord_itms_1,	  precision: 10, scale: 2
		t.decimal	:extr_ord_itms_2,	  precision: 10, scale: 2
		t.decimal	:extr_ord_itms_3,	  precision: 10, scale: 2
		t.decimal	:extr_ord_itms_4,	  precision: 10, scale: 2
		
		t.decimal	:post_pbt_0,	  precision: 10, scale: 2
		t.decimal	:post_pbt_1,	  precision: 10, scale: 2
		t.decimal	:post_pbt_2,	  precision: 10, scale: 2
		t.decimal	:post_pbt_3,	  precision: 10, scale: 2
		t.decimal	:post_pbt_4,	  precision: 10, scale: 2
		
		t.decimal	:tax_0,	  precision: 10, scale: 2
		t.decimal	:tax_1,	  precision: 10, scale: 2
		t.decimal	:tax_2,	  precision: 10, scale: 2
		t.decimal	:tax_3,	  precision: 10, scale: 2
		t.decimal	:tax_4,	  precision: 10, scale: 2
		
		t.decimal	:repo_net_prft_0,	  precision: 10, scale: 2
		t.decimal	:repo_net_prft_1,	  precision: 10, scale: 2
		t.decimal	:repo_net_prft_2,	  precision: 10, scale: 2
		t.decimal	:repo_net_prft_3,	  precision: 10, scale: 2
		t.decimal	:repo_net_prft_4,	  precision: 10, scale: 2

		t.decimal	:tot_val_adtn_0,	  precision: 10, scale: 2
		t.decimal	:tot_val_adtn_1,	  precision: 10, scale: 2
		t.decimal	:tot_val_adtn_2,	  precision: 10, scale: 2
		t.decimal	:tot_val_adtn_3,	  precision: 10, scale: 2
		t.decimal	:tot_val_adtn_4,	  precision: 10, scale: 2
		
		t.decimal	:pref_dvdnd_0,	  precision: 10, scale: 2
		t.decimal	:pref_dvdnd_1,	  precision: 10, scale: 2
		t.decimal	:pref_dvdnd_2,	  precision: 10, scale: 2
		t.decimal	:pref_dvdnd_3,	  precision: 10, scale: 2
		t.decimal	:pref_dvdnd_4,	  precision: 10, scale: 2
		
		t.decimal	:equ_dvdnd_0,	  precision: 10, scale: 2
		t.decimal	:equ_dvdnd_1,	  precision: 10, scale: 2
		t.decimal	:equ_dvdnd_2,	  precision: 10, scale: 2
		t.decimal	:equ_dvdnd_3,	  precision: 10, scale: 2
		t.decimal	:equ_dvdnd_4,	  precision: 10, scale: 2
		
		t.decimal	:co_div_tax_0,	  precision: 10, scale: 2
		t.decimal	:co_div_tax_1,	  precision: 10, scale: 2
		t.decimal	:co_div_tax_2,	  precision: 10, scale: 2
		t.decimal	:co_div_tax_3,	  precision: 10, scale: 2
		t.decimal	:co_div_tax_4,	  precision: 10, scale: 2

		t.decimal	:no_shares_issued_0,	  precision: 10, scale: 2
		t.decimal	:no_shares_issued_1,	  precision: 10, scale: 2
		t.decimal	:no_shares_issued_2,	  precision: 10, scale: 2
		t.decimal	:no_shares_issued_3,	  precision: 10, scale: 2
		t.decimal	:no_shares_issued_4,	  precision: 10, scale: 2
		
		t.decimal	:eps_0,	  precision: 10, scale: 2
		t.decimal	:eps_1,	  precision: 10, scale: 2
		t.decimal	:eps_2,	  precision: 10, scale: 2
		t.decimal	:eps_3,	  precision: 10, scale: 2
		t.decimal	:eps_4,	  precision: 10, scale: 2
		
		t.decimal	:eqt_divdnd_perc_0,	  precision: 10, scale: 2
		t.decimal	:eqt_divdnd_perc_1,	  precision: 10, scale: 2
		t.decimal	:eqt_divdnd_perc_2,	  precision: 10, scale: 2
		t.decimal	:eqt_divdnd_perc_3,	  precision: 10, scale: 2
		t.decimal	:eqt_divdnd_perc_4,	  precision: 10, scale: 2

		t.decimal	:bk_val_0,	  precision: 10, scale: 2
		t.decimal	:bk_val_1,	  precision: 10, scale: 2
		t.decimal	:bk_val_2,	  precision: 10, scale: 2
		t.decimal	:bk_val_3,	  precision: 10, scale: 2
		t.decimal	:bk_val_4,	  precision: 10, scale: 2



      t.timestamps null: false
    end
    add_index :profit_and_losses, :nse_script_name
  end
end



