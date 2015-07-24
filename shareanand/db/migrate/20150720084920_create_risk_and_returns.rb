class CreateRiskAndReturns < ActiveRecord::Migration
  def change
    create_table :risk_and_returns do |t|
      	t.string   "industry"
    	t.string   "isi_num",                                     null: false
    	t.string   "nse_script_name",                             null: false
    	t.string   "industry_index"

	   	t.decimal  "one_yr_mean",      precision: 10, scale: 2	
		t.decimal  "six_months_mean",      precision: 10, scale: 2	
		t.decimal  "three_months_mean",      precision: 10, scale: 2	
		t.decimal  "one_month_mean",      precision: 10, scale: 2	
		
		t.decimal  "one_yr_sigma",      precision: 10, scale: 2
		t.decimal  "six_months_sigma",      precision: 10, scale: 2
		t.decimal  "three_months_sigma",      precision: 10, scale: 2
		t.decimal  "one_month_sigma",      precision: 10, scale: 2

		t.decimal  "z_1_yr",      precision: 4, scale: 2
		t.decimal  "z_6_months",      precision: 4, scale: 2
		t.decimal  "z_3_months",      precision: 4, scale: 2
		t.decimal  "z_1_months",      precision: 4, scale: 2

		t.decimal  "beta_nse_1_yr",      precision: 5, scale: 3
		t.decimal  "beta_nse_6_months",      precision: 5, scale: 3
		t.decimal  "beta_nse_3_months",      precision: 5, scale: 3
		t.decimal  "beta_nse_1_months",      precision: 5, scale: 3

		t.decimal  "beta_index_1_yr",      precision: 5, scale: 3
		t.decimal  "beta_index_6_months",      precision: 5, scale: 3
		t.decimal  "beta_index_3_months",      precision: 5, scale: 3
		t.decimal  "beta_index_1_months",      precision: 5, scale: 3

		t.decimal  "one_yr_high",      precision: 10, scale: 2
		t.decimal  "six_months_high",      precision: 10, scale: 2
		t.decimal  "three_months_high",      precision: 10, scale: 2
		t.decimal  "one_month_high",      precision: 10, scale: 2

		t.decimal  "one_yr_low",      precision: 10, scale: 2
		t.decimal  "six_months_low",      precision: 10, scale: 2
		t.decimal  "three_months_low",      precision: 10, scale: 2
		t.decimal  "one_month_low",      precision: 10, scale: 2

		t.decimal  "probablty_grtr_x_one_yr",      precision: 10, scale: 2 
		t.decimal  "probablty_grtr_x_six_months",      precision: 10, scale: 2
		t.decimal  "probablty_grtr_x_three_months",      precision: 10, scale: 2
		t.decimal  "probablty_grtr_x_one_month",      precision: 10, scale: 2		

		t.decimal  "co_var_one_yr",      precision: 10, scale: 2 
		t.decimal  "co_var_six_months",      precision: 10, scale: 2
		t.decimal  "co_var_three_months",      precision: 10, scale: 2
		t.decimal  "co_var_one_month",      precision: 10, scale: 2		

      t.timestamps null: false
    end
  end
end
