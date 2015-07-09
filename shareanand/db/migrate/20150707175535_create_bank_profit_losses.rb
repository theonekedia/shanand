class CreateBankProfitLosses < ActiveRecord::Migration
  def change
    create_table :bank_profit_losses do |t|
		t.string	:industry
		t.string	:isi_num,	null: false 
		t.string	:nse_script_name, null: false 
		t.boolean	:cur_yr_updated


		t.decimal	:interest_earnd_0,	  precision: 10, scale: 2
		t.decimal	:interest_earnd_1,	  precision: 10, scale: 2
		t.decimal	:interest_earnd_2,	  precision: 10, scale: 2
		t.decimal	:interest_earnd_3,	  precision: 10, scale: 2
		t.decimal	:interest_earnd_4,	  precision: 10, scale: 2

		t.decimal	:other_income_0,	  precision: 10, scale: 2
		t.decimal	:other_income_1,	  precision: 10, scale: 2
		t.decimal	:other_income_2,	  precision: 10, scale: 2
		t.decimal	:other_income_3,	  precision: 10, scale: 2
		t.decimal	:other_income_4,	  precision: 10, scale: 2

		t.decimal	:totl_income_0,	  precision: 10, scale: 2
		t.decimal	:totl_income_1,	  precision: 10, scale: 2
		t.decimal	:totl_income_2,	  precision: 10, scale: 2
		t.decimal	:totl_income_3,	  precision: 10, scale: 2
		t.decimal	:totl_income_4,	  precision: 10, scale: 2

		t.decimal	:interest_expended_0,	  precision: 10, scale: 2
		t.decimal	:interest_expended_1,	  precision: 10, scale: 2
		t.decimal	:interest_expended_2,	  precision: 10, scale: 2
		t.decimal	:interest_expended_3,	  precision: 10, scale: 2
		t.decimal	:interest_expended_4,	  precision: 10, scale: 2

		t.decimal	:employee_cost_0,	  precision: 10, scale: 2
		t.decimal	:employee_cost_1,	  precision: 10, scale: 2
		t.decimal	:employee_cost_2,	  precision: 10, scale: 2
		t.decimal	:employee_cost_3,	  precision: 10, scale: 2
		t.decimal	:employee_cost_4,	  precision: 10, scale: 2

		t.decimal	:selling_admin_expense_0,	  precision: 10, scale: 2
		t.decimal	:selling_admin_expense_1,	  precision: 10, scale: 2
		t.decimal	:selling_admin_expense_2,	  precision: 10, scale: 2
		t.decimal	:selling_admin_expense_3,	  precision: 10, scale: 2
		t.decimal	:selling_admin_expense_4,	  precision: 10, scale: 2

		t.decimal	:depreciation_0,	  precision: 10, scale: 2
		t.decimal	:depreciation_1,	  precision: 10, scale: 2
		t.decimal	:depreciation_2,	  precision: 10, scale: 2
		t.decimal	:depreciation_3,	  precision: 10, scale: 2
		t.decimal	:depreciation_4,	  precision: 10, scale: 2

		t.decimal	:preoperv_exp_cap_0,	  precision: 10, scale: 2
		t.decimal	:preoperv_exp_cap_1,	  precision: 10, scale: 2
		t.decimal	:preoperv_exp_cap_2,	  precision: 10, scale: 2
		t.decimal	:preoperv_exp_cap_3,	  precision: 10, scale: 2
		t.decimal	:preoperv_exp_cap_4,	  precision: 10, scale: 2

		t.decimal	:operating_expenses_0,	  precision: 10, scale: 2
		t.decimal	:operating_expenses_1,	  precision: 10, scale: 2
		t.decimal	:operating_expenses_2,	  precision: 10, scale: 2
		t.decimal	:operating_expenses_3,	  precision: 10, scale: 2
		t.decimal	:operating_expenses_4,	  precision: 10, scale: 2

		t.decimal	:provisions_contingencies_0,	  precision: 10, scale: 2
		t.decimal	:provisions_contingencies_1,	  precision: 10, scale: 2
		t.decimal	:provisions_contingencies_2,	  precision: 10, scale: 2
		t.decimal	:provisions_contingencies_3,	  precision: 10, scale: 2
		t.decimal	:provisions_contingencies_4,	  precision: 10, scale: 2

		t.decimal	:tot_expenses_0,	  precision: 10, scale: 2
		t.decimal	:tot_expenses_1,	  precision: 10, scale: 2
		t.decimal	:tot_expenses_2,	  precision: 10, scale: 2
		t.decimal	:tot_expenses_3,	  precision: 10, scale: 2
		t.decimal	:tot_expenses_4,	  precision: 10, scale: 2

		t.decimal	:net_profit_yr_0,	  precision: 10, scale: 2
		t.decimal	:net_profit_yr_1,	  precision: 10, scale: 2
		t.decimal	:net_profit_yr_2,	  precision: 10, scale: 2
		t.decimal	:net_profit_yr_3,	  precision: 10, scale: 2
		t.decimal	:net_profit_yr_4,	  precision: 10, scale: 2

		t.decimal	:minority_interest_0,	  precision: 10, scale: 2
		t.decimal	:minority_interest_1,	  precision: 10, scale: 2
		t.decimal	:minority_interest_2,	  precision: 10, scale: 2
		t.decimal	:minority_interest_3,	  precision: 10, scale: 2
		t.decimal	:minority_interest_4,	  precision: 10, scale: 2

		t.decimal	:share_pl_associates_0,	  precision: 10, scale: 2
		t.decimal	:share_pl_associates_1,	  precision: 10, scale: 2
		t.decimal	:share_pl_associates_2,	  precision: 10, scale: 2
		t.decimal	:share_pl_associates_3,	  precision: 10, scale: 2
		t.decimal	:share_pl_associates_4,	  precision: 10, scale: 2

		t.decimal	:net_pl_aftr_min_intr_shr_ass_0,	  precision: 10, scale: 2
		t.decimal	:net_pl_aftr_min_intr_shr_ass_1,	  precision: 10, scale: 2
		t.decimal	:net_pl_aftr_min_intr_shr_ass_2,	  precision: 10, scale: 2
		t.decimal	:net_pl_aftr_min_intr_shr_ass_3,	  precision: 10, scale: 2
		t.decimal	:net_pl_aftr_min_intr_shr_ass_4,	  precision: 10, scale: 2

		t.decimal	:extraordinary_items_0,	  precision: 10, scale: 2
		t.decimal	:extraordinary_items_1,	  precision: 10, scale: 2
		t.decimal	:extraordinary_items_2,	  precision: 10, scale: 2
		t.decimal	:extraordinary_items_3,	  precision: 10, scale: 2
		t.decimal	:extraordinary_items_4,	  precision: 10, scale: 2

		t.decimal	:profit_brought_forward_0,	  precision: 10, scale: 2
		t.decimal	:profit_brought_forward_1,	  precision: 10, scale: 2
		t.decimal	:profit_brought_forward_2,	  precision: 10, scale: 2
		t.decimal	:profit_brought_forward_3,	  precision: 10, scale: 2
		t.decimal	:profit_brought_forward_4,	  precision: 10, scale: 2

		t.decimal	:total_0,	  precision: 10, scale: 2
		t.decimal	:total_1,	  precision: 10, scale: 2
		t.decimal	:total_2,	  precision: 10, scale: 2
		t.decimal	:total_3,	  precision: 10, scale: 2
		t.decimal	:total_4,	  precision: 10, scale: 2

		t.decimal	:preference_dividend_0,	  precision: 10, scale: 2
		t.decimal	:preference_dividend_1,	  precision: 10, scale: 2
		t.decimal	:preference_dividend_2,	  precision: 10, scale: 2
		t.decimal	:preference_dividend_3,	  precision: 10, scale: 2
		t.decimal	:preference_dividend_4,	  precision: 10, scale: 2

		t.decimal	:equity_dividend_0,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_1,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_2,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_3,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_4,	  precision: 10, scale: 2


		t.decimal	:corporate_dividend_tax_0,	  precision: 10, scale: 2
		t.decimal	:corporate_dividend_tax_1,	  precision: 10, scale: 2
		t.decimal	:corporate_dividend_tax_2,	  precision: 10, scale: 2
		t.decimal	:corporate_dividend_tax_3,	  precision: 10, scale: 2
		t.decimal	:corporate_dividend_tax_4,	  precision: 10, scale: 2

		t.decimal	:eps_0,	  precision: 10, scale: 2
		t.decimal	:eps_1,	  precision: 10, scale: 2
		t.decimal	:eps_2,	  precision: 10, scale: 2
		t.decimal	:eps_3,	  precision: 10, scale: 2
		t.decimal	:eps_4,	  precision: 10, scale: 2


		t.decimal	:equity_dividend_perc_0,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_perc_1,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_perc_2,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_perc_3,	  precision: 10, scale: 2
		t.decimal	:equity_dividend_perc_4,	  precision: 10, scale: 2

		t.decimal	:book_value_0,	  precision: 10, scale: 2
		t.decimal	:book_value_1,	  precision: 10, scale: 2
		t.decimal	:book_value_2,	  precision: 10, scale: 2
		t.decimal	:book_value_3,	  precision: 10, scale: 2
		t.decimal	:book_value_4,	  precision: 10, scale: 2


		t.decimal	:trns_statut_rserv_0,	  precision: 10, scale: 2
		t.decimal	:trns_statut_rserv_1,	  precision: 10, scale: 2
		t.decimal	:trns_statut_rserv_2,	  precision: 10, scale: 2
		t.decimal	:trns_statut_rserv_3,	  precision: 10, scale: 2
		t.decimal	:trns_statut_rserv_4,	  precision: 10, scale: 2

		t.decimal	:trns_othr_rserv_0,	  precision: 10, scale: 2
		t.decimal	:trns_othr_rserv_1,	  precision: 10, scale: 2
		t.decimal	:trns_othr_rserv_2,	  precision: 10, scale: 2
		t.decimal	:trns_othr_rserv_3,	  precision: 10, scale: 2
		t.decimal	:trns_othr_rserv_4,	  precision: 10, scale: 2


		t.decimal	:propsd_dvdend_trans_govt_0,	  precision: 10, scale: 2
		t.decimal	:propsd_dvdend_trans_govt_1,	  precision: 10, scale: 2
		t.decimal	:propsd_dvdend_trans_govt_2,	  precision: 10, scale: 2
		t.decimal	:propsd_dvdend_trans_govt_3,	  precision: 10, scale: 2
		t.decimal	:propsd_dvdend_trans_govt_4,	  precision: 10, scale: 2

		t.decimal	:bal_cf_bal_sheet_0,	  precision: 10, scale: 2
		t.decimal	:bal_cf_bal_sheet_1,	  precision: 10, scale: 2
		t.decimal	:bal_cf_bal_sheet_2,	  precision: 10, scale: 2
		t.decimal	:bal_cf_bal_sheet_3,	  precision: 10, scale: 2
		t.decimal	:bal_cf_bal_sheet_4,	  precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :bank_profit_losses, :nse_script_name

  end
end
