class CreateBalanceSheets < ActiveRecord::Migration
  def change
    create_table :balance_sheets do |t|
		t.string	:industry
		t.string	:isi_num,	null: false 
		t.string	:nse_script_name, null: false 
		t.boolean	:cur_yr_updated

		t.decimal	:tot_shr_cap_0,	  precision: 10, scale: 2
		t.decimal	:tot_shr_cap_1,	  precision: 10, scale: 2
		t.decimal	:tot_shr_cap_2,	  precision: 10, scale: 2
		t.decimal	:tot_shr_cap_3,	  precision: 10, scale: 2
		t.decimal	:tot_shr_cap_4,	  precision: 10, scale: 2
		
		t.decimal	:eq_shr_cap_0,	  precision: 10, scale: 2
		t.decimal	:eq_shr_cap_1,	  precision: 10, scale: 2
		t.decimal	:eq_shr_cap_2,	  precision: 10, scale: 2
		t.decimal	:eq_shr_cap_3,	  precision: 10, scale: 2
		t.decimal	:eq_shr_cap_4,	  precision: 10, scale: 2
		
		t.decimal	:shr_appl_mny_0,	  precision: 10, scale: 2
		t.decimal	:shr_appl_mny_1,	  precision: 10, scale: 2
		t.decimal	:shr_appl_mny_2,	  precision: 10, scale: 2
		t.decimal	:shr_appl_mny_3,	  precision: 10, scale: 2
		t.decimal	:shr_appl_mny_4,	  precision: 10, scale: 2

		t.decimal	:pre_shr_cap_0,	  precision: 10, scale: 2
		t.decimal	:pre_shr_cap_1,	  precision: 10, scale: 2
		t.decimal	:pre_shr_cap_2,	  precision: 10, scale: 2
		t.decimal	:pre_shr_cap_3,	  precision: 10, scale: 2
		t.decimal	:pre_shr_cap_4,	  precision: 10, scale: 2
		
		t.decimal	:reserves_0,	  precision: 10, scale: 2
		t.decimal	:reserves_1,	  precision: 10, scale: 2
		t.decimal	:reserves_2,	  precision: 10, scale: 2
		t.decimal	:reserves_3,	  precision: 10, scale: 2
		t.decimal	:reserves_4,	  precision: 10, scale: 2
		
		t.decimal	:networth_0,	  precision: 10, scale: 2
		t.decimal	:networth_1,	  precision: 10, scale: 2
		t.decimal	:networth_2,	  precision: 10, scale: 2
		t.decimal	:networth_3,	  precision: 10, scale: 2
		t.decimal	:networth_4,	  precision: 10, scale: 2
		
		t.decimal	:scrd_lons_0,	  precision: 10, scale: 2
		t.decimal	:scrd_lons_1,	  precision: 10, scale: 2
		t.decimal	:scrd_lons_2,	  precision: 10, scale: 2
		t.decimal	:scrd_lons_3,	  precision: 10, scale: 2
		t.decimal	:scrd_lons_4,	  precision: 10, scale: 2

		t.decimal	:unscrd_lons_0,	  precision: 10, scale: 2
		t.decimal	:unscrd_lons_1,	  precision: 10, scale: 2
		t.decimal	:unscrd_lons_2,	  precision: 10, scale: 2
		t.decimal	:unscrd_lons_3,	  precision: 10, scale: 2
		t.decimal	:unscrd_lons_4,	  precision: 10, scale: 2

		t.decimal	:tot_debt_0,	  precision: 10, scale: 2
		t.decimal	:tot_debt_1,	  precision: 10, scale: 2
		t.decimal	:tot_debt_2,	  precision: 10, scale: 2
		t.decimal	:tot_debt_3,	  precision: 10, scale: 2
		t.decimal	:tot_debt_4,	  precision: 10, scale: 2

		t.decimal	:tot_liabs_0,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_1,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_2,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_3,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_4,	  precision: 10, scale: 2
		
		t.decimal	:gros_block_0,	  precision: 10, scale: 2
		t.decimal	:gros_block_1,	  precision: 10, scale: 2
		t.decimal	:gros_block_2,	  precision: 10, scale: 2
		t.decimal	:gros_block_3,	  precision: 10, scale: 2
		t.decimal	:gros_block_4,	  precision: 10, scale: 2
		
		t.decimal	:reval_rsrvs_0,	  precision: 10, scale: 2
		t.decimal	:reval_rsrvs_1,	  precision: 10, scale: 2
		t.decimal	:reval_rsrvs_2,	  precision: 10, scale: 2
		t.decimal	:reval_rsrvs_3,	  precision: 10, scale: 2
		t.decimal	:reval_rsrvs_4,	  precision: 10, scale: 2
		
		t.decimal	:accm_deprec_0,	  precision: 10, scale: 2
		t.decimal	:accm_deprec_1,	  precision: 10, scale: 2
		t.decimal	:accm_deprec_2,	  precision: 10, scale: 2
		t.decimal	:accm_deprec_3,	  precision: 10, scale: 2
		t.decimal	:accm_deprec_4,	  precision: 10, scale: 2
		
		t.decimal	:net_block_0,	  precision: 10, scale: 2
		t.decimal	:net_block_1,	  precision: 10, scale: 2
		t.decimal	:net_block_2,	  precision: 10, scale: 2
		t.decimal	:net_block_3,	  precision: 10, scale: 2
		t.decimal	:net_block_4,	  precision: 10, scale: 2
		
		t.decimal	:cap_wip_0,	  precision: 10, scale: 2
		t.decimal	:cap_wip_1,	  precision: 10, scale: 2
		t.decimal	:cap_wip_2,	  precision: 10, scale: 2
		t.decimal	:cap_wip_3,	  precision: 10, scale: 2
		t.decimal	:cap_wip_4,	  precision: 10, scale: 2
		
		t.decimal	:invstmnts_0,	  precision: 10, scale: 2
		t.decimal	:invstmnts_1,	  precision: 10, scale: 2
		t.decimal	:invstmnts_2,	  precision: 10, scale: 2
		t.decimal	:invstmnts_3,	  precision: 10, scale: 2
		t.decimal	:invstmnts_4,	  precision: 10, scale: 2
		
		t.decimal	:inventory_0,	  precision: 10, scale: 2
		t.decimal	:inventory_1,	  precision: 10, scale: 2
		t.decimal	:inventory_2,	  precision: 10, scale: 2
		t.decimal	:inventory_3,	  precision: 10, scale: 2
		t.decimal	:inventory_4,	  precision: 10, scale: 2
		
		t.decimal	:sndr_debts_0,	  precision: 10, scale: 2
		t.decimal	:sndr_debts_1,	  precision: 10, scale: 2
		t.decimal	:sndr_debts_2,	  precision: 10, scale: 2
		t.decimal	:sndr_debts_3,	  precision: 10, scale: 2
		t.decimal	:sndr_debts_4,	  precision: 10, scale: 2
		
		t.decimal	:c_b_bal_0,	  precision: 10, scale: 2
		t.decimal	:c_b_bal_1,	  precision: 10, scale: 2
		t.decimal	:c_b_bal_2,	  precision: 10, scale: 2
		t.decimal	:c_b_bal_3,	  precision: 10, scale: 2
		t.decimal	:c_b_bal_4,	  precision: 10, scale: 2
		
		t.decimal	:tot_curr_assets_0,	  precision: 10, scale: 2
		t.decimal	:tot_curr_assets_1,	  precision: 10, scale: 2
		t.decimal	:tot_curr_assets_2,	  precision: 10, scale: 2
		t.decimal	:tot_curr_assets_3,	  precision: 10, scale: 2
		t.decimal	:tot_curr_assets_4,	  precision: 10, scale: 2
		
		t.decimal	:loans_addv_0,	  precision: 10, scale: 2
		t.decimal	:loans_addv_1,	  precision: 10, scale: 2
		t.decimal	:loans_addv_2,	  precision: 10, scale: 2
		t.decimal	:loans_addv_3,	  precision: 10, scale: 2
		t.decimal	:loans_addv_4,	  precision: 10, scale: 2
		
		t.decimal	:fixd_deps_0,	  precision: 10, scale: 2
		t.decimal	:fixd_deps_1,	  precision: 10, scale: 2
		t.decimal	:fixd_deps_2,	  precision: 10, scale: 2
		t.decimal	:fixd_deps_3,	  precision: 10, scale: 2
		t.decimal	:fixd_deps_4,	  precision: 10, scale: 2
		
		t.decimal	:tot_ca_loans_adv_0,	  precision: 10, scale: 2
		t.decimal	:tot_ca_loans_adv_1,	  precision: 10, scale: 2
		t.decimal	:tot_ca_loans_adv_2,	  precision: 10, scale: 2
		t.decimal	:tot_ca_loans_adv_3,	  precision: 10, scale: 2
		t.decimal	:tot_ca_loans_adv_4,	  precision: 10, scale: 2
		
		t.decimal	:defrd_cr_0,	  precision: 10, scale: 2
		t.decimal	:defrd_cr_1,	  precision: 10, scale: 2
		t.decimal	:defrd_cr_2,	  precision: 10, scale: 2
		t.decimal	:defrd_cr_3,	  precision: 10, scale: 2
		t.decimal	:defrd_cr_4,	  precision: 10, scale: 2
		
		t.decimal	:curr_liabs_0,	  precision: 10, scale: 2
		t.decimal	:curr_liabs_1,	  precision: 10, scale: 2
		t.decimal	:curr_liabs_2,	  precision: 10, scale: 2
		t.decimal	:curr_liabs_3,	  precision: 10, scale: 2
		t.decimal	:curr_liabs_4,	  precision: 10, scale: 2
		
		t.decimal	:provisions_0,	  precision: 10, scale: 2
		t.decimal	:provisions_1,	  precision: 10, scale: 2
		t.decimal	:provisions_2,	  precision: 10, scale: 2
		t.decimal	:provisions_3,	  precision: 10, scale: 2
		t.decimal	:provisions_4,	  precision: 10, scale: 2
		
		t.decimal	:tot_cl_provs_0,	  precision: 10, scale: 2
		t.decimal	:tot_cl_provs_1,	  precision: 10, scale: 2
		t.decimal	:tot_cl_provs_2,	  precision: 10, scale: 2
		t.decimal	:tot_cl_provs_3,	  precision: 10, scale: 2
		t.decimal	:tot_cl_provs_4,	  precision: 10, scale: 2
		
		t.decimal	:net_curr_assets_0,	  precision: 10, scale: 2
		t.decimal	:net_curr_assets_1,	  precision: 10, scale: 2
		t.decimal	:net_curr_assets_2,	  precision: 10, scale: 2
		t.decimal	:net_curr_assets_3,	  precision: 10, scale: 2
		t.decimal	:net_curr_assets_4,	  precision: 10, scale: 2
		
		t.decimal	:misc_expen_0,	  precision: 10, scale: 2
		t.decimal	:misc_expen_1,	  precision: 10, scale: 2
		t.decimal	:misc_expen_2,	  precision: 10, scale: 2
		t.decimal	:misc_expen_3,	  precision: 10, scale: 2
		t.decimal	:misc_expen_4,	  precision: 10, scale: 2
		
		t.decimal	:tot_assets_0,	  precision: 10, scale: 2
		t.decimal	:tot_assets_1,	  precision: 10, scale: 2
		t.decimal	:tot_assets_2,	  precision: 10, scale: 2
		t.decimal	:tot_assets_3,	  precision: 10, scale: 2
		t.decimal	:tot_assets_4,	  precision: 10, scale: 2
		
		t.decimal	:contignt_liabs_0,	  precision: 10, scale: 2
		t.decimal	:contignt_liabs_1,	  precision: 10, scale: 2
		t.decimal	:contignt_liabs_2,	  precision: 10, scale: 2
		t.decimal	:contignt_liabs_3,	  precision: 10, scale: 2
		t.decimal	:contignt_liabs_4,	  precision: 10, scale: 2
		
		t.decimal	:bk_val_0,	  precision: 10, scale: 2
		t.decimal	:bk_val_1,	  precision: 10, scale: 2
		t.decimal	:bk_val_2,	  precision: 10, scale: 2
		t.decimal	:bk_val_3,	  precision: 10, scale: 2
		t.decimal	:bk_val_4,	  precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :balance_sheets, :nse_script_name
  end
end
