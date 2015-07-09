class CreateBankBalanceSheets < ActiveRecord::Migration
  def change
    create_table :bank_balance_sheets do |t|

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

		t.decimal	:init_cntrb_stlr_0,	  precision: 10, scale: 2
		t.decimal	:init_cntrb_stlr_1,	  precision: 10, scale: 2
		t.decimal	:init_cntrb_stlr_2,	  precision: 10, scale: 2
		t.decimal	:init_cntrb_stlr_3,	  precision: 10, scale: 2
		t.decimal	:init_cntrb_stlr_4,	  precision: 10, scale: 2

		t.decimal	:pref_shr_appln_mny_0,	  precision: 10, scale: 2
		t.decimal	:pref_shr_appln_mny_1,	  precision: 10, scale: 2
		t.decimal	:pref_shr_appln_mny_2,	  precision: 10, scale: 2
		t.decimal	:pref_shr_appln_mny_3,	  precision: 10, scale: 2
		t.decimal	:pref_shr_appln_mny_4,	  precision: 10, scale: 2

		t.decimal	:emply_stck_optn_0,	  precision: 10, scale: 2
		t.decimal	:emply_stck_optn_1,	  precision: 10, scale: 2
		t.decimal	:emply_stck_optn_2,	  precision: 10, scale: 2
		t.decimal	:emply_stck_optn_3,	  precision: 10, scale: 2
		t.decimal	:emply_stck_optn_4,	  precision: 10, scale: 2

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
		
		t.decimal	:deposits_0,	  precision: 10, scale: 2
		t.decimal	:deposits_1,	  precision: 10, scale: 2
		t.decimal	:deposits_2,	  precision: 10, scale: 2
		t.decimal	:deposits_3,	  precision: 10, scale: 2
		t.decimal	:deposits_4,	  precision: 10, scale: 2

		t.decimal	:borrowings_0,	  precision: 10, scale: 2
		t.decimal	:borrowings_1,	  precision: 10, scale: 2
		t.decimal	:borrowings_2,	  precision: 10, scale: 2
		t.decimal	:borrowings_3,	  precision: 10, scale: 2
		t.decimal	:borrowings_4,	  precision: 10, scale: 2

		t.decimal	:tot_debt_0,	  precision: 10, scale: 2
		t.decimal	:tot_debt_1,	  precision: 10, scale: 2
		t.decimal	:tot_debt_2,	  precision: 10, scale: 2
		t.decimal	:tot_debt_3,	  precision: 10, scale: 2
		t.decimal	:tot_debt_4,	  precision: 10, scale: 2

		t.decimal	:minort_interest_0,	  precision: 10, scale: 2
		t.decimal	:minort_interest_1,	  precision: 10, scale: 2
		t.decimal	:minort_interest_2,	  precision: 10, scale: 2
		t.decimal	:minort_interest_3,	  precision: 10, scale: 2
		t.decimal	:minort_interest_4,	  precision: 10, scale: 2

		t.decimal	:polc_hldrs_fnds_0,	  precision: 10, scale: 2
		t.decimal	:polc_hldrs_fnds_1,	  precision: 10, scale: 2
		t.decimal	:polc_hldrs_fnds_2,	  precision: 10, scale: 2
		t.decimal	:polc_hldrs_fnds_3,	  precision: 10, scale: 2
		t.decimal	:polc_hldrs_fnds_4,	  precision: 10, scale: 2

		t.decimal	:grp_shr_jnt_vntr_0,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_1,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_2,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_3,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_4,	  precision: 10, scale: 2

		t.decimal	:othr_liabs_provsns_0,	  precision: 10, scale: 2
		t.decimal	:othr_liabs_provsns_1,	  precision: 10, scale: 2
		t.decimal	:othr_liabs_provsns_2,	  precision: 10, scale: 2
		t.decimal	:othr_liabs_provsns_3,	  precision: 10, scale: 2
		t.decimal	:othr_liabs_provsns_4,	  precision: 10, scale: 2

		t.decimal	:tot_liabs_0,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_1,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_2,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_3,	  precision: 10, scale: 2
		t.decimal	:tot_liabs_4,	  precision: 10, scale: 2

		t.decimal	:cash_bal_rbi_0,	  precision: 10, scale: 2
		t.decimal	:cash_bal_rbi_1,	  precision: 10, scale: 2
		t.decimal	:cash_bal_rbi_2,	  precision: 10, scale: 2
		t.decimal	:cash_bal_rbi_3,	  precision: 10, scale: 2
		t.decimal	:cash_bal_rbi_4,	  precision: 10, scale: 2

		t.decimal	:bal_bank_mny_cal_0,	  precision: 10, scale: 2
		t.decimal	:bal_bank_mny_cal_1,	  precision: 10, scale: 2
		t.decimal	:bal_bank_mny_cal_2,	  precision: 10, scale: 2
		t.decimal	:bal_bank_mny_cal_3,	  precision: 10, scale: 2
		t.decimal	:bal_bank_mny_cal_4,	  precision: 10, scale: 2

		t.decimal	:advances_0,	  precision: 10, scale: 2
		t.decimal	:advances_1,	  precision: 10, scale: 2
		t.decimal	:advances_2,	  precision: 10, scale: 2
		t.decimal	:advances_3,	  precision: 10, scale: 2
		t.decimal	:advances_4,	  precision: 10, scale: 2


		t.decimal	:invstmnts_0,	  precision: 10, scale: 2
		t.decimal	:invstmnts_1,	  precision: 10, scale: 2
		t.decimal	:invstmnts_2,	  precision: 10, scale: 2
		t.decimal	:invstmnts_3,	  precision: 10, scale: 2
		t.decimal	:invstmnts_4,	  precision: 10, scale: 2

		t.decimal	:gros_block_0,	  precision: 10, scale: 2
		t.decimal	:gros_block_1,	  precision: 10, scale: 2
		t.decimal	:gros_block_2,	  precision: 10, scale: 2
		t.decimal	:gros_block_3,	  precision: 10, scale: 2
		t.decimal	:gros_block_4,	  precision: 10, scale: 2

		t.decimal	:reval_reserves_0,	  precision: 10, scale: 2
		t.decimal	:reval_reserves_1,	  precision: 10, scale: 2
		t.decimal	:reval_reserves_2,	  precision: 10, scale: 2
		t.decimal	:reval_reserves_3,	  precision: 10, scale: 2
		t.decimal	:reval_reserves_4,	  precision: 10, scale: 2


		t.decimal	:accum_deprectn_0,	  precision: 10, scale: 2
		t.decimal	:accum_deprectn_1,	  precision: 10, scale: 2
		t.decimal	:accum_deprectn_2,	  precision: 10, scale: 2
		t.decimal	:accum_deprectn_3,	  precision: 10, scale: 2
		t.decimal	:accum_deprectn_4,	  precision: 10, scale: 2

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

		t.decimal	:other_assets_0,	  precision: 10, scale: 2
		t.decimal	:other_assets_1,	  precision: 10, scale: 2
		t.decimal	:other_assets_2,	  precision: 10, scale: 2
		t.decimal	:other_assets_3,	  precision: 10, scale: 2
		t.decimal	:other_assets_4,	  precision: 10, scale: 2

		t.decimal	:minort_interest_assets_0,	  precision: 10, scale: 2
		t.decimal	:minort_interest_assets_1,	  precision: 10, scale: 2
		t.decimal	:minort_interest_assets_2,	  precision: 10, scale: 2
		t.decimal	:minort_interest_assets_3,	  precision: 10, scale: 2
		t.decimal	:minort_interest_assets_4,	  precision: 10, scale: 2

		t.decimal	:grp_shr_jnt_vntr_assets_0,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_assets_1,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_assets_2,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_assets_3,	  precision: 10, scale: 2
		t.decimal	:grp_shr_jnt_vntr_assets_4,	  precision: 10, scale: 2

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

		t.decimal	:bills_fr_collect_0,	  precision: 10, scale: 2
		t.decimal	:bills_fr_collect_1,	  precision: 10, scale: 2
		t.decimal	:bills_fr_collect_2,	  precision: 10, scale: 2
		t.decimal	:bills_fr_collect_3,	  precision: 10, scale: 2
		t.decimal	:bills_fr_collect_4,	  precision: 10, scale: 2
		
		t.decimal	:bk_val_0,	  precision: 10, scale: 2
		t.decimal	:bk_val_1,	  precision: 10, scale: 2
		t.decimal	:bk_val_2,	  precision: 10, scale: 2
		t.decimal	:bk_val_3,	  precision: 10, scale: 2
		t.decimal	:bk_val_4,	  precision: 10, scale: 2

      t.timestamps null: false
    end
    add_index :bank_balance_sheets, :nse_script_name
  end
end
