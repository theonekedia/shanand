# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150719174046) do

  create_table "balance_sheets", force: :cascade do |t|
    t.string   "industry"
    t.string   "isi_num",                                     null: false
    t.string   "nse_script_name",                             null: false
    t.boolean  "cur_yr_updated"
    t.decimal  "tot_shr_cap_0",      precision: 10, scale: 2
    t.decimal  "tot_shr_cap_1",      precision: 10, scale: 2
    t.decimal  "tot_shr_cap_2",      precision: 10, scale: 2
    t.decimal  "tot_shr_cap_3",      precision: 10, scale: 2
    t.decimal  "tot_shr_cap_4",      precision: 10, scale: 2
    t.decimal  "eq_shr_cap_0",       precision: 10, scale: 2
    t.decimal  "eq_shr_cap_1",       precision: 10, scale: 2
    t.decimal  "eq_shr_cap_2",       precision: 10, scale: 2
    t.decimal  "eq_shr_cap_3",       precision: 10, scale: 2
    t.decimal  "eq_shr_cap_4",       precision: 10, scale: 2
    t.decimal  "shr_appl_mny_0",     precision: 10, scale: 2
    t.decimal  "shr_appl_mny_1",     precision: 10, scale: 2
    t.decimal  "shr_appl_mny_2",     precision: 10, scale: 2
    t.decimal  "shr_appl_mny_3",     precision: 10, scale: 2
    t.decimal  "shr_appl_mny_4",     precision: 10, scale: 2
    t.decimal  "pre_shr_cap_0",      precision: 10, scale: 2
    t.decimal  "pre_shr_cap_1",      precision: 10, scale: 2
    t.decimal  "pre_shr_cap_2",      precision: 10, scale: 2
    t.decimal  "pre_shr_cap_3",      precision: 10, scale: 2
    t.decimal  "pre_shr_cap_4",      precision: 10, scale: 2
    t.decimal  "reserves_0",         precision: 10, scale: 2
    t.decimal  "reserves_1",         precision: 10, scale: 2
    t.decimal  "reserves_2",         precision: 10, scale: 2
    t.decimal  "reserves_3",         precision: 10, scale: 2
    t.decimal  "reserves_4",         precision: 10, scale: 2
    t.decimal  "networth_0",         precision: 10, scale: 2
    t.decimal  "networth_1",         precision: 10, scale: 2
    t.decimal  "networth_2",         precision: 10, scale: 2
    t.decimal  "networth_3",         precision: 10, scale: 2
    t.decimal  "networth_4",         precision: 10, scale: 2
    t.decimal  "scrd_lons_0",        precision: 10, scale: 2
    t.decimal  "scrd_lons_1",        precision: 10, scale: 2
    t.decimal  "scrd_lons_2",        precision: 10, scale: 2
    t.decimal  "scrd_lons_3",        precision: 10, scale: 2
    t.decimal  "scrd_lons_4",        precision: 10, scale: 2
    t.decimal  "unscrd_lons_0",      precision: 10, scale: 2
    t.decimal  "unscrd_lons_1",      precision: 10, scale: 2
    t.decimal  "unscrd_lons_2",      precision: 10, scale: 2
    t.decimal  "unscrd_lons_3",      precision: 10, scale: 2
    t.decimal  "unscrd_lons_4",      precision: 10, scale: 2
    t.decimal  "tot_debt_0",         precision: 10, scale: 2
    t.decimal  "tot_debt_1",         precision: 10, scale: 2
    t.decimal  "tot_debt_2",         precision: 10, scale: 2
    t.decimal  "tot_debt_3",         precision: 10, scale: 2
    t.decimal  "tot_debt_4",         precision: 10, scale: 2
    t.decimal  "tot_liabs_0",        precision: 10, scale: 2
    t.decimal  "tot_liabs_1",        precision: 10, scale: 2
    t.decimal  "tot_liabs_2",        precision: 10, scale: 2
    t.decimal  "tot_liabs_3",        precision: 10, scale: 2
    t.decimal  "tot_liabs_4",        precision: 10, scale: 2
    t.decimal  "gros_block_0",       precision: 10, scale: 2
    t.decimal  "gros_block_1",       precision: 10, scale: 2
    t.decimal  "gros_block_2",       precision: 10, scale: 2
    t.decimal  "gros_block_3",       precision: 10, scale: 2
    t.decimal  "gros_block_4",       precision: 10, scale: 2
    t.decimal  "reval_rsrvs_0",      precision: 10, scale: 2
    t.decimal  "reval_rsrvs_1",      precision: 10, scale: 2
    t.decimal  "reval_rsrvs_2",      precision: 10, scale: 2
    t.decimal  "reval_rsrvs_3",      precision: 10, scale: 2
    t.decimal  "reval_rsrvs_4",      precision: 10, scale: 2
    t.decimal  "accm_deprec_0",      precision: 10, scale: 2
    t.decimal  "accm_deprec_1",      precision: 10, scale: 2
    t.decimal  "accm_deprec_2",      precision: 10, scale: 2
    t.decimal  "accm_deprec_3",      precision: 10, scale: 2
    t.decimal  "accm_deprec_4",      precision: 10, scale: 2
    t.decimal  "net_block_0",        precision: 10, scale: 2
    t.decimal  "net_block_1",        precision: 10, scale: 2
    t.decimal  "net_block_2",        precision: 10, scale: 2
    t.decimal  "net_block_3",        precision: 10, scale: 2
    t.decimal  "net_block_4",        precision: 10, scale: 2
    t.decimal  "cap_wip_0",          precision: 10, scale: 2
    t.decimal  "cap_wip_1",          precision: 10, scale: 2
    t.decimal  "cap_wip_2",          precision: 10, scale: 2
    t.decimal  "cap_wip_3",          precision: 10, scale: 2
    t.decimal  "cap_wip_4",          precision: 10, scale: 2
    t.decimal  "invstmnts_0",        precision: 10, scale: 2
    t.decimal  "invstmnts_1",        precision: 10, scale: 2
    t.decimal  "invstmnts_2",        precision: 10, scale: 2
    t.decimal  "invstmnts_3",        precision: 10, scale: 2
    t.decimal  "invstmnts_4",        precision: 10, scale: 2
    t.decimal  "inventory_0",        precision: 10, scale: 2
    t.decimal  "inventory_1",        precision: 10, scale: 2
    t.decimal  "inventory_2",        precision: 10, scale: 2
    t.decimal  "inventory_3",        precision: 10, scale: 2
    t.decimal  "inventory_4",        precision: 10, scale: 2
    t.decimal  "sndr_debts_0",       precision: 10, scale: 2
    t.decimal  "sndr_debts_1",       precision: 10, scale: 2
    t.decimal  "sndr_debts_2",       precision: 10, scale: 2
    t.decimal  "sndr_debts_3",       precision: 10, scale: 2
    t.decimal  "sndr_debts_4",       precision: 10, scale: 2
    t.decimal  "c_b_bal_0",          precision: 10, scale: 2
    t.decimal  "c_b_bal_1",          precision: 10, scale: 2
    t.decimal  "c_b_bal_2",          precision: 10, scale: 2
    t.decimal  "c_b_bal_3",          precision: 10, scale: 2
    t.decimal  "c_b_bal_4",          precision: 10, scale: 2
    t.decimal  "tot_curr_assets_0",  precision: 10, scale: 2
    t.decimal  "tot_curr_assets_1",  precision: 10, scale: 2
    t.decimal  "tot_curr_assets_2",  precision: 10, scale: 2
    t.decimal  "tot_curr_assets_3",  precision: 10, scale: 2
    t.decimal  "tot_curr_assets_4",  precision: 10, scale: 2
    t.decimal  "loans_addv_0",       precision: 10, scale: 2
    t.decimal  "loans_addv_1",       precision: 10, scale: 2
    t.decimal  "loans_addv_2",       precision: 10, scale: 2
    t.decimal  "loans_addv_3",       precision: 10, scale: 2
    t.decimal  "loans_addv_4",       precision: 10, scale: 2
    t.decimal  "fixd_deps_0",        precision: 10, scale: 2
    t.decimal  "fixd_deps_1",        precision: 10, scale: 2
    t.decimal  "fixd_deps_2",        precision: 10, scale: 2
    t.decimal  "fixd_deps_3",        precision: 10, scale: 2
    t.decimal  "fixd_deps_4",        precision: 10, scale: 2
    t.decimal  "tot_ca_loans_adv_0", precision: 10, scale: 2
    t.decimal  "tot_ca_loans_adv_1", precision: 10, scale: 2
    t.decimal  "tot_ca_loans_adv_2", precision: 10, scale: 2
    t.decimal  "tot_ca_loans_adv_3", precision: 10, scale: 2
    t.decimal  "tot_ca_loans_adv_4", precision: 10, scale: 2
    t.decimal  "defrd_cr_0",         precision: 10, scale: 2
    t.decimal  "defrd_cr_1",         precision: 10, scale: 2
    t.decimal  "defrd_cr_2",         precision: 10, scale: 2
    t.decimal  "defrd_cr_3",         precision: 10, scale: 2
    t.decimal  "defrd_cr_4",         precision: 10, scale: 2
    t.decimal  "curr_liabs_0",       precision: 10, scale: 2
    t.decimal  "curr_liabs_1",       precision: 10, scale: 2
    t.decimal  "curr_liabs_2",       precision: 10, scale: 2
    t.decimal  "curr_liabs_3",       precision: 10, scale: 2
    t.decimal  "curr_liabs_4",       precision: 10, scale: 2
    t.decimal  "provisions_0",       precision: 10, scale: 2
    t.decimal  "provisions_1",       precision: 10, scale: 2
    t.decimal  "provisions_2",       precision: 10, scale: 2
    t.decimal  "provisions_3",       precision: 10, scale: 2
    t.decimal  "provisions_4",       precision: 10, scale: 2
    t.decimal  "tot_cl_provs_0",     precision: 10, scale: 2
    t.decimal  "tot_cl_provs_1",     precision: 10, scale: 2
    t.decimal  "tot_cl_provs_2",     precision: 10, scale: 2
    t.decimal  "tot_cl_provs_3",     precision: 10, scale: 2
    t.decimal  "tot_cl_provs_4",     precision: 10, scale: 2
    t.decimal  "net_curr_assets_0",  precision: 10, scale: 2
    t.decimal  "net_curr_assets_1",  precision: 10, scale: 2
    t.decimal  "net_curr_assets_2",  precision: 10, scale: 2
    t.decimal  "net_curr_assets_3",  precision: 10, scale: 2
    t.decimal  "net_curr_assets_4",  precision: 10, scale: 2
    t.decimal  "misc_expen_0",       precision: 10, scale: 2
    t.decimal  "misc_expen_1",       precision: 10, scale: 2
    t.decimal  "misc_expen_2",       precision: 10, scale: 2
    t.decimal  "misc_expen_3",       precision: 10, scale: 2
    t.decimal  "misc_expen_4",       precision: 10, scale: 2
    t.decimal  "tot_assets_0",       precision: 10, scale: 2
    t.decimal  "tot_assets_1",       precision: 10, scale: 2
    t.decimal  "tot_assets_2",       precision: 10, scale: 2
    t.decimal  "tot_assets_3",       precision: 10, scale: 2
    t.decimal  "tot_assets_4",       precision: 10, scale: 2
    t.decimal  "contignt_liabs_0",   precision: 10, scale: 2
    t.decimal  "contignt_liabs_1",   precision: 10, scale: 2
    t.decimal  "contignt_liabs_2",   precision: 10, scale: 2
    t.decimal  "contignt_liabs_3",   precision: 10, scale: 2
    t.decimal  "contignt_liabs_4",   precision: 10, scale: 2
    t.decimal  "bk_val_0",           precision: 10, scale: 2
    t.decimal  "bk_val_1",           precision: 10, scale: 2
    t.decimal  "bk_val_2",           precision: 10, scale: 2
    t.decimal  "bk_val_3",           precision: 10, scale: 2
    t.decimal  "bk_val_4",           precision: 10, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "balance_sheets", ["nse_script_name"], name: "index_balance_sheets_on_nse_script_name"

  create_table "bank_balance_sheets", force: :cascade do |t|
    t.string   "industry"
    t.string   "isi_num",                                            null: false
    t.string   "nse_script_name",                                    null: false
    t.boolean  "cur_yr_updated"
    t.decimal  "tot_shr_cap_0",             precision: 10, scale: 2
    t.decimal  "tot_shr_cap_1",             precision: 10, scale: 2
    t.decimal  "tot_shr_cap_2",             precision: 10, scale: 2
    t.decimal  "tot_shr_cap_3",             precision: 10, scale: 2
    t.decimal  "tot_shr_cap_4",             precision: 10, scale: 2
    t.decimal  "eq_shr_cap_0",              precision: 10, scale: 2
    t.decimal  "eq_shr_cap_1",              precision: 10, scale: 2
    t.decimal  "eq_shr_cap_2",              precision: 10, scale: 2
    t.decimal  "eq_shr_cap_3",              precision: 10, scale: 2
    t.decimal  "eq_shr_cap_4",              precision: 10, scale: 2
    t.decimal  "shr_appl_mny_0",            precision: 10, scale: 2
    t.decimal  "shr_appl_mny_1",            precision: 10, scale: 2
    t.decimal  "shr_appl_mny_2",            precision: 10, scale: 2
    t.decimal  "shr_appl_mny_3",            precision: 10, scale: 2
    t.decimal  "shr_appl_mny_4",            precision: 10, scale: 2
    t.decimal  "pre_shr_cap_0",             precision: 10, scale: 2
    t.decimal  "pre_shr_cap_1",             precision: 10, scale: 2
    t.decimal  "pre_shr_cap_2",             precision: 10, scale: 2
    t.decimal  "pre_shr_cap_3",             precision: 10, scale: 2
    t.decimal  "pre_shr_cap_4",             precision: 10, scale: 2
    t.decimal  "init_cntrb_stlr_0",         precision: 10, scale: 2
    t.decimal  "init_cntrb_stlr_1",         precision: 10, scale: 2
    t.decimal  "init_cntrb_stlr_2",         precision: 10, scale: 2
    t.decimal  "init_cntrb_stlr_3",         precision: 10, scale: 2
    t.decimal  "init_cntrb_stlr_4",         precision: 10, scale: 2
    t.decimal  "pref_shr_appln_mny_0",      precision: 10, scale: 2
    t.decimal  "pref_shr_appln_mny_1",      precision: 10, scale: 2
    t.decimal  "pref_shr_appln_mny_2",      precision: 10, scale: 2
    t.decimal  "pref_shr_appln_mny_3",      precision: 10, scale: 2
    t.decimal  "pref_shr_appln_mny_4",      precision: 10, scale: 2
    t.decimal  "emply_stck_optn_0",         precision: 10, scale: 2
    t.decimal  "emply_stck_optn_1",         precision: 10, scale: 2
    t.decimal  "emply_stck_optn_2",         precision: 10, scale: 2
    t.decimal  "emply_stck_optn_3",         precision: 10, scale: 2
    t.decimal  "emply_stck_optn_4",         precision: 10, scale: 2
    t.decimal  "reserves_0",                precision: 10, scale: 2
    t.decimal  "reserves_1",                precision: 10, scale: 2
    t.decimal  "reserves_2",                precision: 10, scale: 2
    t.decimal  "reserves_3",                precision: 10, scale: 2
    t.decimal  "reserves_4",                precision: 10, scale: 2
    t.decimal  "networth_0",                precision: 10, scale: 2
    t.decimal  "networth_1",                precision: 10, scale: 2
    t.decimal  "networth_2",                precision: 10, scale: 2
    t.decimal  "networth_3",                precision: 10, scale: 2
    t.decimal  "networth_4",                precision: 10, scale: 2
    t.decimal  "deposits_0",                precision: 10, scale: 2
    t.decimal  "deposits_1",                precision: 10, scale: 2
    t.decimal  "deposits_2",                precision: 10, scale: 2
    t.decimal  "deposits_3",                precision: 10, scale: 2
    t.decimal  "deposits_4",                precision: 10, scale: 2
    t.decimal  "borrowings_0",              precision: 10, scale: 2
    t.decimal  "borrowings_1",              precision: 10, scale: 2
    t.decimal  "borrowings_2",              precision: 10, scale: 2
    t.decimal  "borrowings_3",              precision: 10, scale: 2
    t.decimal  "borrowings_4",              precision: 10, scale: 2
    t.decimal  "tot_debt_0",                precision: 10, scale: 2
    t.decimal  "tot_debt_1",                precision: 10, scale: 2
    t.decimal  "tot_debt_2",                precision: 10, scale: 2
    t.decimal  "tot_debt_3",                precision: 10, scale: 2
    t.decimal  "tot_debt_4",                precision: 10, scale: 2
    t.decimal  "minort_interest_0",         precision: 10, scale: 2
    t.decimal  "minort_interest_1",         precision: 10, scale: 2
    t.decimal  "minort_interest_2",         precision: 10, scale: 2
    t.decimal  "minort_interest_3",         precision: 10, scale: 2
    t.decimal  "minort_interest_4",         precision: 10, scale: 2
    t.decimal  "polc_hldrs_fnds_0",         precision: 10, scale: 2
    t.decimal  "polc_hldrs_fnds_1",         precision: 10, scale: 2
    t.decimal  "polc_hldrs_fnds_2",         precision: 10, scale: 2
    t.decimal  "polc_hldrs_fnds_3",         precision: 10, scale: 2
    t.decimal  "polc_hldrs_fnds_4",         precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_0",        precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_1",        precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_2",        precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_3",        precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_4",        precision: 10, scale: 2
    t.decimal  "othr_liabs_provsns_0",      precision: 10, scale: 2
    t.decimal  "othr_liabs_provsns_1",      precision: 10, scale: 2
    t.decimal  "othr_liabs_provsns_2",      precision: 10, scale: 2
    t.decimal  "othr_liabs_provsns_3",      precision: 10, scale: 2
    t.decimal  "othr_liabs_provsns_4",      precision: 10, scale: 2
    t.decimal  "tot_liabs_0",               precision: 10, scale: 2
    t.decimal  "tot_liabs_1",               precision: 10, scale: 2
    t.decimal  "tot_liabs_2",               precision: 10, scale: 2
    t.decimal  "tot_liabs_3",               precision: 10, scale: 2
    t.decimal  "tot_liabs_4",               precision: 10, scale: 2
    t.decimal  "cash_bal_rbi_0",            precision: 10, scale: 2
    t.decimal  "cash_bal_rbi_1",            precision: 10, scale: 2
    t.decimal  "cash_bal_rbi_2",            precision: 10, scale: 2
    t.decimal  "cash_bal_rbi_3",            precision: 10, scale: 2
    t.decimal  "cash_bal_rbi_4",            precision: 10, scale: 2
    t.decimal  "bal_bank_mny_cal_0",        precision: 10, scale: 2
    t.decimal  "bal_bank_mny_cal_1",        precision: 10, scale: 2
    t.decimal  "bal_bank_mny_cal_2",        precision: 10, scale: 2
    t.decimal  "bal_bank_mny_cal_3",        precision: 10, scale: 2
    t.decimal  "bal_bank_mny_cal_4",        precision: 10, scale: 2
    t.decimal  "advances_0",                precision: 10, scale: 2
    t.decimal  "advances_1",                precision: 10, scale: 2
    t.decimal  "advances_2",                precision: 10, scale: 2
    t.decimal  "advances_3",                precision: 10, scale: 2
    t.decimal  "advances_4",                precision: 10, scale: 2
    t.decimal  "invstmnts_0",               precision: 10, scale: 2
    t.decimal  "invstmnts_1",               precision: 10, scale: 2
    t.decimal  "invstmnts_2",               precision: 10, scale: 2
    t.decimal  "invstmnts_3",               precision: 10, scale: 2
    t.decimal  "invstmnts_4",               precision: 10, scale: 2
    t.decimal  "gros_block_0",              precision: 10, scale: 2
    t.decimal  "gros_block_1",              precision: 10, scale: 2
    t.decimal  "gros_block_2",              precision: 10, scale: 2
    t.decimal  "gros_block_3",              precision: 10, scale: 2
    t.decimal  "gros_block_4",              precision: 10, scale: 2
    t.decimal  "reval_reserves_0",          precision: 10, scale: 2
    t.decimal  "reval_reserves_1",          precision: 10, scale: 2
    t.decimal  "reval_reserves_2",          precision: 10, scale: 2
    t.decimal  "reval_reserves_3",          precision: 10, scale: 2
    t.decimal  "reval_reserves_4",          precision: 10, scale: 2
    t.decimal  "accum_deprectn_0",          precision: 10, scale: 2
    t.decimal  "accum_deprectn_1",          precision: 10, scale: 2
    t.decimal  "accum_deprectn_2",          precision: 10, scale: 2
    t.decimal  "accum_deprectn_3",          precision: 10, scale: 2
    t.decimal  "accum_deprectn_4",          precision: 10, scale: 2
    t.decimal  "net_block_0",               precision: 10, scale: 2
    t.decimal  "net_block_1",               precision: 10, scale: 2
    t.decimal  "net_block_2",               precision: 10, scale: 2
    t.decimal  "net_block_3",               precision: 10, scale: 2
    t.decimal  "net_block_4",               precision: 10, scale: 2
    t.decimal  "cap_wip_0",                 precision: 10, scale: 2
    t.decimal  "cap_wip_1",                 precision: 10, scale: 2
    t.decimal  "cap_wip_2",                 precision: 10, scale: 2
    t.decimal  "cap_wip_3",                 precision: 10, scale: 2
    t.decimal  "cap_wip_4",                 precision: 10, scale: 2
    t.decimal  "other_assets_0",            precision: 10, scale: 2
    t.decimal  "other_assets_1",            precision: 10, scale: 2
    t.decimal  "other_assets_2",            precision: 10, scale: 2
    t.decimal  "other_assets_3",            precision: 10, scale: 2
    t.decimal  "other_assets_4",            precision: 10, scale: 2
    t.decimal  "minort_interest_assets_0",  precision: 10, scale: 2
    t.decimal  "minort_interest_assets_1",  precision: 10, scale: 2
    t.decimal  "minort_interest_assets_2",  precision: 10, scale: 2
    t.decimal  "minort_interest_assets_3",  precision: 10, scale: 2
    t.decimal  "minort_interest_assets_4",  precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_assets_0", precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_assets_1", precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_assets_2", precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_assets_3", precision: 10, scale: 2
    t.decimal  "grp_shr_jnt_vntr_assets_4", precision: 10, scale: 2
    t.decimal  "tot_assets_0",              precision: 10, scale: 2
    t.decimal  "tot_assets_1",              precision: 10, scale: 2
    t.decimal  "tot_assets_2",              precision: 10, scale: 2
    t.decimal  "tot_assets_3",              precision: 10, scale: 2
    t.decimal  "tot_assets_4",              precision: 10, scale: 2
    t.decimal  "contignt_liabs_0",          precision: 10, scale: 2
    t.decimal  "contignt_liabs_1",          precision: 10, scale: 2
    t.decimal  "contignt_liabs_2",          precision: 10, scale: 2
    t.decimal  "contignt_liabs_3",          precision: 10, scale: 2
    t.decimal  "contignt_liabs_4",          precision: 10, scale: 2
    t.decimal  "bills_fr_collect_0",        precision: 10, scale: 2
    t.decimal  "bills_fr_collect_1",        precision: 10, scale: 2
    t.decimal  "bills_fr_collect_2",        precision: 10, scale: 2
    t.decimal  "bills_fr_collect_3",        precision: 10, scale: 2
    t.decimal  "bills_fr_collect_4",        precision: 10, scale: 2
    t.decimal  "bk_val_0",                  precision: 10, scale: 2
    t.decimal  "bk_val_1",                  precision: 10, scale: 2
    t.decimal  "bk_val_2",                  precision: 10, scale: 2
    t.decimal  "bk_val_3",                  precision: 10, scale: 2
    t.decimal  "bk_val_4",                  precision: 10, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "bank_balance_sheets", ["nse_script_name"], name: "index_bank_balance_sheets_on_nse_script_name"

  create_table "bank_profit_losses", force: :cascade do |t|
    t.string   "industry"
    t.string   "isi_num",                                                 null: false
    t.string   "nse_script_name",                                         null: false
    t.boolean  "cur_yr_updated"
    t.decimal  "interest_earnd_0",               precision: 10, scale: 2
    t.decimal  "interest_earnd_1",               precision: 10, scale: 2
    t.decimal  "interest_earnd_2",               precision: 10, scale: 2
    t.decimal  "interest_earnd_3",               precision: 10, scale: 2
    t.decimal  "interest_earnd_4",               precision: 10, scale: 2
    t.decimal  "other_income_0",                 precision: 10, scale: 2
    t.decimal  "other_income_1",                 precision: 10, scale: 2
    t.decimal  "other_income_2",                 precision: 10, scale: 2
    t.decimal  "other_income_3",                 precision: 10, scale: 2
    t.decimal  "other_income_4",                 precision: 10, scale: 2
    t.decimal  "totl_income_0",                  precision: 10, scale: 2
    t.decimal  "totl_income_1",                  precision: 10, scale: 2
    t.decimal  "totl_income_2",                  precision: 10, scale: 2
    t.decimal  "totl_income_3",                  precision: 10, scale: 2
    t.decimal  "totl_income_4",                  precision: 10, scale: 2
    t.decimal  "interest_expended_0",            precision: 10, scale: 2
    t.decimal  "interest_expended_1",            precision: 10, scale: 2
    t.decimal  "interest_expended_2",            precision: 10, scale: 2
    t.decimal  "interest_expended_3",            precision: 10, scale: 2
    t.decimal  "interest_expended_4",            precision: 10, scale: 2
    t.decimal  "employee_cost_0",                precision: 10, scale: 2
    t.decimal  "employee_cost_1",                precision: 10, scale: 2
    t.decimal  "employee_cost_2",                precision: 10, scale: 2
    t.decimal  "employee_cost_3",                precision: 10, scale: 2
    t.decimal  "employee_cost_4",                precision: 10, scale: 2
    t.decimal  "selling_admin_expense_0",        precision: 10, scale: 2
    t.decimal  "selling_admin_expense_1",        precision: 10, scale: 2
    t.decimal  "selling_admin_expense_2",        precision: 10, scale: 2
    t.decimal  "selling_admin_expense_3",        precision: 10, scale: 2
    t.decimal  "selling_admin_expense_4",        precision: 10, scale: 2
    t.decimal  "depreciation_0",                 precision: 10, scale: 2
    t.decimal  "depreciation_1",                 precision: 10, scale: 2
    t.decimal  "depreciation_2",                 precision: 10, scale: 2
    t.decimal  "depreciation_3",                 precision: 10, scale: 2
    t.decimal  "depreciation_4",                 precision: 10, scale: 2
    t.decimal  "preoperv_exp_cap_0",             precision: 10, scale: 2
    t.decimal  "preoperv_exp_cap_1",             precision: 10, scale: 2
    t.decimal  "preoperv_exp_cap_2",             precision: 10, scale: 2
    t.decimal  "preoperv_exp_cap_3",             precision: 10, scale: 2
    t.decimal  "preoperv_exp_cap_4",             precision: 10, scale: 2
    t.decimal  "operating_expenses_0",           precision: 10, scale: 2
    t.decimal  "operating_expenses_1",           precision: 10, scale: 2
    t.decimal  "operating_expenses_2",           precision: 10, scale: 2
    t.decimal  "operating_expenses_3",           precision: 10, scale: 2
    t.decimal  "operating_expenses_4",           precision: 10, scale: 2
    t.decimal  "provisions_contingencies_0",     precision: 10, scale: 2
    t.decimal  "provisions_contingencies_1",     precision: 10, scale: 2
    t.decimal  "provisions_contingencies_2",     precision: 10, scale: 2
    t.decimal  "provisions_contingencies_3",     precision: 10, scale: 2
    t.decimal  "provisions_contingencies_4",     precision: 10, scale: 2
    t.decimal  "tot_expenses_0",                 precision: 10, scale: 2
    t.decimal  "tot_expenses_1",                 precision: 10, scale: 2
    t.decimal  "tot_expenses_2",                 precision: 10, scale: 2
    t.decimal  "tot_expenses_3",                 precision: 10, scale: 2
    t.decimal  "tot_expenses_4",                 precision: 10, scale: 2
    t.decimal  "net_profit_yr_0",                precision: 10, scale: 2
    t.decimal  "net_profit_yr_1",                precision: 10, scale: 2
    t.decimal  "net_profit_yr_2",                precision: 10, scale: 2
    t.decimal  "net_profit_yr_3",                precision: 10, scale: 2
    t.decimal  "net_profit_yr_4",                precision: 10, scale: 2
    t.decimal  "minority_interest_0",            precision: 10, scale: 2
    t.decimal  "minority_interest_1",            precision: 10, scale: 2
    t.decimal  "minority_interest_2",            precision: 10, scale: 2
    t.decimal  "minority_interest_3",            precision: 10, scale: 2
    t.decimal  "minority_interest_4",            precision: 10, scale: 2
    t.decimal  "share_pl_associates_0",          precision: 10, scale: 2
    t.decimal  "share_pl_associates_1",          precision: 10, scale: 2
    t.decimal  "share_pl_associates_2",          precision: 10, scale: 2
    t.decimal  "share_pl_associates_3",          precision: 10, scale: 2
    t.decimal  "share_pl_associates_4",          precision: 10, scale: 2
    t.decimal  "net_pl_aftr_min_intr_shr_ass_0", precision: 10, scale: 2
    t.decimal  "net_pl_aftr_min_intr_shr_ass_1", precision: 10, scale: 2
    t.decimal  "net_pl_aftr_min_intr_shr_ass_2", precision: 10, scale: 2
    t.decimal  "net_pl_aftr_min_intr_shr_ass_3", precision: 10, scale: 2
    t.decimal  "net_pl_aftr_min_intr_shr_ass_4", precision: 10, scale: 2
    t.decimal  "extraordinary_items_0",          precision: 10, scale: 2
    t.decimal  "extraordinary_items_1",          precision: 10, scale: 2
    t.decimal  "extraordinary_items_2",          precision: 10, scale: 2
    t.decimal  "extraordinary_items_3",          precision: 10, scale: 2
    t.decimal  "extraordinary_items_4",          precision: 10, scale: 2
    t.decimal  "profit_brought_forward_0",       precision: 10, scale: 2
    t.decimal  "profit_brought_forward_1",       precision: 10, scale: 2
    t.decimal  "profit_brought_forward_2",       precision: 10, scale: 2
    t.decimal  "profit_brought_forward_3",       precision: 10, scale: 2
    t.decimal  "profit_brought_forward_4",       precision: 10, scale: 2
    t.decimal  "total_0",                        precision: 10, scale: 2
    t.decimal  "total_1",                        precision: 10, scale: 2
    t.decimal  "total_2",                        precision: 10, scale: 2
    t.decimal  "total_3",                        precision: 10, scale: 2
    t.decimal  "total_4",                        precision: 10, scale: 2
    t.decimal  "preference_dividend_0",          precision: 10, scale: 2
    t.decimal  "preference_dividend_1",          precision: 10, scale: 2
    t.decimal  "preference_dividend_2",          precision: 10, scale: 2
    t.decimal  "preference_dividend_3",          precision: 10, scale: 2
    t.decimal  "preference_dividend_4",          precision: 10, scale: 2
    t.decimal  "equity_dividend_0",              precision: 10, scale: 2
    t.decimal  "equity_dividend_1",              precision: 10, scale: 2
    t.decimal  "equity_dividend_2",              precision: 10, scale: 2
    t.decimal  "equity_dividend_3",              precision: 10, scale: 2
    t.decimal  "equity_dividend_4",              precision: 10, scale: 2
    t.decimal  "corporate_dividend_tax_0",       precision: 10, scale: 2
    t.decimal  "corporate_dividend_tax_1",       precision: 10, scale: 2
    t.decimal  "corporate_dividend_tax_2",       precision: 10, scale: 2
    t.decimal  "corporate_dividend_tax_3",       precision: 10, scale: 2
    t.decimal  "corporate_dividend_tax_4",       precision: 10, scale: 2
    t.decimal  "eps_0",                          precision: 10, scale: 2
    t.decimal  "eps_1",                          precision: 10, scale: 2
    t.decimal  "eps_2",                          precision: 10, scale: 2
    t.decimal  "eps_3",                          precision: 10, scale: 2
    t.decimal  "eps_4",                          precision: 10, scale: 2
    t.decimal  "equity_dividend_perc_0",         precision: 10, scale: 2
    t.decimal  "equity_dividend_perc_1",         precision: 10, scale: 2
    t.decimal  "equity_dividend_perc_2",         precision: 10, scale: 2
    t.decimal  "equity_dividend_perc_3",         precision: 10, scale: 2
    t.decimal  "equity_dividend_perc_4",         precision: 10, scale: 2
    t.decimal  "book_value_0",                   precision: 10, scale: 2
    t.decimal  "book_value_1",                   precision: 10, scale: 2
    t.decimal  "book_value_2",                   precision: 10, scale: 2
    t.decimal  "book_value_3",                   precision: 10, scale: 2
    t.decimal  "book_value_4",                   precision: 10, scale: 2
    t.decimal  "trns_statut_rserv_0",            precision: 10, scale: 2
    t.decimal  "trns_statut_rserv_1",            precision: 10, scale: 2
    t.decimal  "trns_statut_rserv_2",            precision: 10, scale: 2
    t.decimal  "trns_statut_rserv_3",            precision: 10, scale: 2
    t.decimal  "trns_statut_rserv_4",            precision: 10, scale: 2
    t.decimal  "trns_othr_rserv_0",              precision: 10, scale: 2
    t.decimal  "trns_othr_rserv_1",              precision: 10, scale: 2
    t.decimal  "trns_othr_rserv_2",              precision: 10, scale: 2
    t.decimal  "trns_othr_rserv_3",              precision: 10, scale: 2
    t.decimal  "trns_othr_rserv_4",              precision: 10, scale: 2
    t.decimal  "propsd_dvdend_trans_govt_0",     precision: 10, scale: 2
    t.decimal  "propsd_dvdend_trans_govt_1",     precision: 10, scale: 2
    t.decimal  "propsd_dvdend_trans_govt_2",     precision: 10, scale: 2
    t.decimal  "propsd_dvdend_trans_govt_3",     precision: 10, scale: 2
    t.decimal  "propsd_dvdend_trans_govt_4",     precision: 10, scale: 2
    t.decimal  "bal_cf_bal_sheet_0",             precision: 10, scale: 2
    t.decimal  "bal_cf_bal_sheet_1",             precision: 10, scale: 2
    t.decimal  "bal_cf_bal_sheet_2",             precision: 10, scale: 2
    t.decimal  "bal_cf_bal_sheet_3",             precision: 10, scale: 2
    t.decimal  "bal_cf_bal_sheet_4",             precision: 10, scale: 2
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "bank_profit_losses", ["nse_script_name"], name: "index_bank_profit_losses_on_nse_script_name"

  create_table "cash_flow_statements", force: :cascade do |t|
    t.string  "industry"
    t.string  "isi_num",                                            null: false
    t.string  "nse_script_name",                                    null: false
    t.string  "last_updated_year"
    t.decimal "net_profit_bfr_tax_0",      precision: 10, scale: 2
    t.decimal "net_profit_bfr_tax_1",      precision: 10, scale: 2
    t.decimal "net_profit_bfr_tax_2",      precision: 10, scale: 2
    t.decimal "net_profit_bfr_tax_3",      precision: 10, scale: 2
    t.decimal "net_profit_bfr_tax_4",      precision: 10, scale: 2
    t.decimal "net_cash_4m_operating_0",   precision: 10, scale: 2
    t.decimal "net_cash_4m_operating_1",   precision: 10, scale: 2
    t.decimal "net_cash_4m_operating_2",   precision: 10, scale: 2
    t.decimal "net_cash_4m_operating_3",   precision: 10, scale: 2
    t.decimal "net_cash_4m_operating_4",   precision: 10, scale: 2
    t.decimal "net_cash_investing_0",      precision: 10, scale: 2
    t.decimal "net_cash_investing_1",      precision: 10, scale: 2
    t.decimal "net_cash_investing_2",      precision: 10, scale: 2
    t.decimal "net_cash_investing_3",      precision: 10, scale: 2
    t.decimal "net_cash_investing_4",      precision: 10, scale: 2
    t.decimal "net_cash_financing_0",      precision: 10, scale: 2
    t.decimal "net_cash_financing_1",      precision: 10, scale: 2
    t.decimal "net_cash_financing_2",      precision: 10, scale: 2
    t.decimal "net_cash_financing_3",      precision: 10, scale: 2
    t.decimal "net_cash_financing_4",      precision: 10, scale: 2
    t.decimal "net_chng_in_cash_equivs_0", precision: 10, scale: 2
    t.decimal "net_chng_in_cash_equivs_1", precision: 10, scale: 2
    t.decimal "net_chng_in_cash_equivs_2", precision: 10, scale: 2
    t.decimal "net_chng_in_cash_equivs_3", precision: 10, scale: 2
    t.decimal "net_chng_in_cash_equivs_4", precision: 10, scale: 2
    t.decimal "opening_cash_equivs_0",     precision: 10, scale: 2
    t.decimal "opening_cash_equivs_1",     precision: 10, scale: 2
    t.decimal "opening_cash_equivs_2",     precision: 10, scale: 2
    t.decimal "opening_cash_equivs_3",     precision: 10, scale: 2
    t.decimal "opening_cash_equivs_4",     precision: 10, scale: 2
    t.decimal "closing_cash_equivs_0",     precision: 10, scale: 2
    t.decimal "closing_cash_equivs_1",     precision: 10, scale: 2
    t.decimal "closing_cash_equivs_2",     precision: 10, scale: 2
    t.decimal "closing_cash_equivs_3",     precision: 10, scale: 2
    t.decimal "closing_cash_equivs_4",     precision: 10, scale: 2
  end

  add_index "cash_flow_statements", ["nse_script_name"], name: "cash_flow_statements_on_nse_script_name", unique: true

  create_table "day_tradings", force: :cascade do |t|
    t.string   "isi_num",                                         null: false
    t.string   "nse_script_name",                                 null: false
    t.decimal  "today_open",             precision: 10, scale: 2
    t.decimal  "today_high",             precision: 10, scale: 2
    t.decimal  "today_close",            precision: 10, scale: 2
    t.decimal  "pre_day_close",          precision: 10, scale: 2
    t.integer  "tot_shares_traded"
    t.decimal  "perc_change",            precision: 5,  scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.decimal  "today_low",              precision: 10, scale: 2
    t.decimal  "graham_fvp",             precision: 10, scale: 2
    t.decimal  "eps",                    precision: 10, scale: 2
    t.decimal  "book_value",             precision: 10, scale: 2
    t.decimal  "market_cap",             precision: 10, scale: 2
    t.decimal  "tot_outstanding_shares", precision: 10, scale: 2
    t.decimal  "pe_ratio",               precision: 10, scale: 2
    t.decimal  "f2_week_low",            precision: 10, scale: 2
    t.decimal  "f2_week_high",           precision: 10, scale: 2
    t.string   "industry"
  end

  add_index "day_tradings", ["nse_script_name"], name: "index_day_tradings_on_nse_script_name"

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "industry_details", force: :cascade do |t|
    t.string   "industry"
    t.text     "info"
    t.string   "bse_index"
    t.decimal  "avg_pe",                          precision: 10, scale: 2
    t.decimal  "avg_eps",                         precision: 10, scale: 2
    t.decimal  "avg_gross_profit_margin",         precision: 10, scale: 2
    t.decimal  "avg_oper_profit_margn",           precision: 10, scale: 2
    t.decimal  "avg_net_proft_margn",             precision: 10, scale: 2
    t.decimal  "avg_current_ratio",               precision: 10, scale: 2
    t.decimal  "avg_turnover_ratio",              precision: 10, scale: 2
    t.decimal  "avg_assets_turnover_ratio",       precision: 10, scale: 2
    t.decimal  "avg_fixed_charge_coverage_ratio", precision: 10, scale: 2
    t.decimal  "avg_interest_coverage_ratio",     precision: 10, scale: 2
    t.decimal  "avg_dividend_coverage_ratio",     precision: 10, scale: 2
    t.decimal  "avg_debt_equity_ratio",           precision: 10, scale: 2
    t.decimal  "avg_debt_assets_ratio",           precision: 10, scale: 2
    t.decimal  "avg_return_on_asset",             precision: 10, scale: 2
    t.decimal  "avg_return_on_capital_employed",  precision: 10, scale: 2
    t.decimal  "avg_return_on_networth",          precision: 10, scale: 2
    t.decimal  "avg_return_on_equity",            precision: 10, scale: 2
    t.decimal  "avg_debt_Ratio",                  precision: 10, scale: 2
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "industry_details", ["industry"], name: "index_industry_details_on_industry", unique: true

  create_table "profit_and_losses", force: :cascade do |t|
    t.string   "industry"
    t.string   "isi_num",                                         null: false
    t.string   "nse_script_name",                                 null: false
    t.boolean  "cur_yr_updated"
    t.decimal  "sal_turnovr_0",          precision: 10, scale: 2
    t.decimal  "sal_turnovr_1",          precision: 10, scale: 2
    t.decimal  "sal_turnovr_2",          precision: 10, scale: 2
    t.decimal  "sal_turnovr_3",          precision: 10, scale: 2
    t.decimal  "sal_turnovr_4",          precision: 10, scale: 2
    t.decimal  "excs_duty_0",            precision: 10, scale: 2
    t.decimal  "excs_duty_1",            precision: 10, scale: 2
    t.decimal  "excs_duty_2",            precision: 10, scale: 2
    t.decimal  "excs_duty_3",            precision: 10, scale: 2
    t.decimal  "excs_duty_4",            precision: 10, scale: 2
    t.decimal  "net_sales_0",            precision: 10, scale: 2
    t.decimal  "net_sales_1",            precision: 10, scale: 2
    t.decimal  "net_sales_2",            precision: 10, scale: 2
    t.decimal  "net_sales_3",            precision: 10, scale: 2
    t.decimal  "net_sales_4",            precision: 10, scale: 2
    t.decimal  "other_income_0",         precision: 10, scale: 2
    t.decimal  "other_income_1",         precision: 10, scale: 2
    t.decimal  "other_income_2",         precision: 10, scale: 2
    t.decimal  "other_income_3",         precision: 10, scale: 2
    t.decimal  "other_income_4",         precision: 10, scale: 2
    t.decimal  "stck_adjst_0",           precision: 10, scale: 2
    t.decimal  "stck_adjst_1",           precision: 10, scale: 2
    t.decimal  "stck_adjst_2",           precision: 10, scale: 2
    t.decimal  "stck_adjst_3",           precision: 10, scale: 2
    t.decimal  "stck_adjst_4",           precision: 10, scale: 2
    t.decimal  "tot_income_0",           precision: 10, scale: 2
    t.decimal  "tot_income_1",           precision: 10, scale: 2
    t.decimal  "tot_income_2",           precision: 10, scale: 2
    t.decimal  "tot_income_3",           precision: 10, scale: 2
    t.decimal  "tot_income_4",           precision: 10, scale: 2
    t.decimal  "raw_matrls_0",           precision: 10, scale: 2
    t.decimal  "raw_matrls_1",           precision: 10, scale: 2
    t.decimal  "raw_matrls_2",           precision: 10, scale: 2
    t.decimal  "raw_matrls_3",           precision: 10, scale: 2
    t.decimal  "raw_matrls_4",           precision: 10, scale: 2
    t.decimal  "pwr_fuel_cst_0",         precision: 10, scale: 2
    t.decimal  "pwr_fuel_cst_1",         precision: 10, scale: 2
    t.decimal  "pwr_fuel_cst_2",         precision: 10, scale: 2
    t.decimal  "pwr_fuel_cst_3",         precision: 10, scale: 2
    t.decimal  "pwr_fuel_cst_4",         precision: 10, scale: 2
    t.decimal  "exmploy_cst_0",          precision: 10, scale: 2
    t.decimal  "exmploy_cst_1",          precision: 10, scale: 2
    t.decimal  "exmploy_cst_2",          precision: 10, scale: 2
    t.decimal  "exmploy_cst_3",          precision: 10, scale: 2
    t.decimal  "exmploy_cst_4",          precision: 10, scale: 2
    t.decimal  "othr_manufctr_exp_0",    precision: 10, scale: 2
    t.decimal  "othr_manufctr_exp_1",    precision: 10, scale: 2
    t.decimal  "othr_manufctr_exp_2",    precision: 10, scale: 2
    t.decimal  "othr_manufctr_exp_3",    precision: 10, scale: 2
    t.decimal  "othr_manufctr_exp_4",    precision: 10, scale: 2
    t.decimal  "selling_admin_exp_0",    precision: 10, scale: 2
    t.decimal  "selling_admin_exp_1",    precision: 10, scale: 2
    t.decimal  "selling_admin_exp_2",    precision: 10, scale: 2
    t.decimal  "selling_admin_exp_3",    precision: 10, scale: 2
    t.decimal  "selling_admin_exp_4",    precision: 10, scale: 2
    t.decimal  "misc_exp_0",             precision: 10, scale: 2
    t.decimal  "misc_exp_1",             precision: 10, scale: 2
    t.decimal  "misc_exp_2",             precision: 10, scale: 2
    t.decimal  "misc_exp_3",             precision: 10, scale: 2
    t.decimal  "misc_exp_4",             precision: 10, scale: 2
    t.decimal  "preoperative_exp_cap_0", precision: 10, scale: 2
    t.decimal  "preoperative_exp_cap_1", precision: 10, scale: 2
    t.decimal  "preoperative_exp_cap_2", precision: 10, scale: 2
    t.decimal  "preoperative_exp_cap_3", precision: 10, scale: 2
    t.decimal  "preoperative_exp_cap_4", precision: 10, scale: 2
    t.decimal  "tot_exp_0",              precision: 10, scale: 2
    t.decimal  "tot_exp_1",              precision: 10, scale: 2
    t.decimal  "tot_exp_2",              precision: 10, scale: 2
    t.decimal  "tot_exp_3",              precision: 10, scale: 2
    t.decimal  "tot_exp_4",              precision: 10, scale: 2
    t.decimal  "opertng_prft_0",         precision: 10, scale: 2
    t.decimal  "opertng_prft_1",         precision: 10, scale: 2
    t.decimal  "opertng_prft_2",         precision: 10, scale: 2
    t.decimal  "opertng_prft_3",         precision: 10, scale: 2
    t.decimal  "opertng_prft_4",         precision: 10, scale: 2
    t.decimal  "pbdit_0",                precision: 10, scale: 2
    t.decimal  "pbdit_1",                precision: 10, scale: 2
    t.decimal  "pbdit_2",                precision: 10, scale: 2
    t.decimal  "pbdit_3",                precision: 10, scale: 2
    t.decimal  "pbdit_4",                precision: 10, scale: 2
    t.decimal  "interest_0",             precision: 10, scale: 2
    t.decimal  "interest_1",             precision: 10, scale: 2
    t.decimal  "interest_2",             precision: 10, scale: 2
    t.decimal  "interest_3",             precision: 10, scale: 2
    t.decimal  "interest_4",             precision: 10, scale: 2
    t.decimal  "pbdt_0",                 precision: 10, scale: 2
    t.decimal  "pbdt_1",                 precision: 10, scale: 2
    t.decimal  "pbdt_2",                 precision: 10, scale: 2
    t.decimal  "pbdt_3",                 precision: 10, scale: 2
    t.decimal  "pbdt_4",                 precision: 10, scale: 2
    t.decimal  "deprec_0",               precision: 10, scale: 2
    t.decimal  "deprec_1",               precision: 10, scale: 2
    t.decimal  "deprec_2",               precision: 10, scale: 2
    t.decimal  "deprec_3",               precision: 10, scale: 2
    t.decimal  "deprec_4",               precision: 10, scale: 2
    t.decimal  "othr_writn_off_0",       precision: 10, scale: 2
    t.decimal  "othr_writn_off_1",       precision: 10, scale: 2
    t.decimal  "othr_writn_off_2",       precision: 10, scale: 2
    t.decimal  "othr_writn_off_3",       precision: 10, scale: 2
    t.decimal  "othr_writn_off_4",       precision: 10, scale: 2
    t.decimal  "pbt_0",                  precision: 10, scale: 2
    t.decimal  "pbt_1",                  precision: 10, scale: 2
    t.decimal  "pbt_2",                  precision: 10, scale: 2
    t.decimal  "pbt_3",                  precision: 10, scale: 2
    t.decimal  "pbt_4",                  precision: 10, scale: 2
    t.decimal  "extr_ord_itms_0",        precision: 10, scale: 2
    t.decimal  "extr_ord_itms_1",        precision: 10, scale: 2
    t.decimal  "extr_ord_itms_2",        precision: 10, scale: 2
    t.decimal  "extr_ord_itms_3",        precision: 10, scale: 2
    t.decimal  "extr_ord_itms_4",        precision: 10, scale: 2
    t.decimal  "post_pbt_0",             precision: 10, scale: 2
    t.decimal  "post_pbt_1",             precision: 10, scale: 2
    t.decimal  "post_pbt_2",             precision: 10, scale: 2
    t.decimal  "post_pbt_3",             precision: 10, scale: 2
    t.decimal  "post_pbt_4",             precision: 10, scale: 2
    t.decimal  "tax_0",                  precision: 10, scale: 2
    t.decimal  "tax_1",                  precision: 10, scale: 2
    t.decimal  "tax_2",                  precision: 10, scale: 2
    t.decimal  "tax_3",                  precision: 10, scale: 2
    t.decimal  "tax_4",                  precision: 10, scale: 2
    t.decimal  "repo_net_prft_0",        precision: 10, scale: 2
    t.decimal  "repo_net_prft_1",        precision: 10, scale: 2
    t.decimal  "repo_net_prft_2",        precision: 10, scale: 2
    t.decimal  "repo_net_prft_3",        precision: 10, scale: 2
    t.decimal  "repo_net_prft_4",        precision: 10, scale: 2
    t.decimal  "tot_val_adtn_0",         precision: 10, scale: 2
    t.decimal  "tot_val_adtn_1",         precision: 10, scale: 2
    t.decimal  "tot_val_adtn_2",         precision: 10, scale: 2
    t.decimal  "tot_val_adtn_3",         precision: 10, scale: 2
    t.decimal  "tot_val_adtn_4",         precision: 10, scale: 2
    t.decimal  "pref_dvdnd_0",           precision: 10, scale: 2
    t.decimal  "pref_dvdnd_1",           precision: 10, scale: 2
    t.decimal  "pref_dvdnd_2",           precision: 10, scale: 2
    t.decimal  "pref_dvdnd_3",           precision: 10, scale: 2
    t.decimal  "pref_dvdnd_4",           precision: 10, scale: 2
    t.decimal  "equ_dvdnd_0",            precision: 10, scale: 2
    t.decimal  "equ_dvdnd_1",            precision: 10, scale: 2
    t.decimal  "equ_dvdnd_2",            precision: 10, scale: 2
    t.decimal  "equ_dvdnd_3",            precision: 10, scale: 2
    t.decimal  "equ_dvdnd_4",            precision: 10, scale: 2
    t.decimal  "co_div_tax_0",           precision: 10, scale: 2
    t.decimal  "co_div_tax_1",           precision: 10, scale: 2
    t.decimal  "co_div_tax_2",           precision: 10, scale: 2
    t.decimal  "co_div_tax_3",           precision: 10, scale: 2
    t.decimal  "co_div_tax_4",           precision: 10, scale: 2
    t.decimal  "no_shares_issued_0",     precision: 10, scale: 2
    t.decimal  "no_shares_issued_1",     precision: 10, scale: 2
    t.decimal  "no_shares_issued_2",     precision: 10, scale: 2
    t.decimal  "no_shares_issued_3",     precision: 10, scale: 2
    t.decimal  "no_shares_issued_4",     precision: 10, scale: 2
    t.decimal  "eps_0",                  precision: 10, scale: 2
    t.decimal  "eps_1",                  precision: 10, scale: 2
    t.decimal  "eps_2",                  precision: 10, scale: 2
    t.decimal  "eps_3",                  precision: 10, scale: 2
    t.decimal  "eps_4",                  precision: 10, scale: 2
    t.decimal  "eqt_divdnd_perc_0",      precision: 10, scale: 2
    t.decimal  "eqt_divdnd_perc_1",      precision: 10, scale: 2
    t.decimal  "eqt_divdnd_perc_2",      precision: 10, scale: 2
    t.decimal  "eqt_divdnd_perc_3",      precision: 10, scale: 2
    t.decimal  "eqt_divdnd_perc_4",      precision: 10, scale: 2
    t.decimal  "bk_val_0",               precision: 10, scale: 2
    t.decimal  "bk_val_1",               precision: 10, scale: 2
    t.decimal  "bk_val_2",               precision: 10, scale: 2
    t.decimal  "bk_val_3",               precision: 10, scale: 2
    t.decimal  "bk_val_4",               precision: 10, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "profit_and_losses", ["nse_script_name"], name: "index_profit_and_losses_on_nse_script_name"

  create_table "ratios_and_analyses", force: :cascade do |t|
    t.string   "industry"
    t.string   "isi_num",                                                null: false
    t.string   "nse_script_name",                                        null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.decimal  "gross_profit_margin_0",         precision: 10, scale: 2
    t.decimal  "gross_profit_margin_1",         precision: 10, scale: 2
    t.decimal  "gross_profit_margin_2",         precision: 10, scale: 2
    t.decimal  "gross_profit_margin_3",         precision: 10, scale: 2
    t.decimal  "gross_profit_margin_4",         precision: 10, scale: 2
    t.decimal  "oper_profit_margn_0",           precision: 10, scale: 2
    t.decimal  "oper_profit_margn_1",           precision: 10, scale: 2
    t.decimal  "oper_profit_margn_2",           precision: 10, scale: 2
    t.decimal  "oper_profit_margn_3",           precision: 10, scale: 2
    t.decimal  "oper_profit_margn_4",           precision: 10, scale: 2
    t.decimal  "net_proft_margn_0",             precision: 10, scale: 2
    t.decimal  "net_proft_margn_1",             precision: 10, scale: 2
    t.decimal  "net_proft_margn_2",             precision: 10, scale: 2
    t.decimal  "net_proft_margn_3",             precision: 10, scale: 2
    t.decimal  "net_proft_margn_4",             precision: 10, scale: 2
    t.decimal  "eps_0",                         precision: 10, scale: 2
    t.decimal  "eps_1",                         precision: 10, scale: 2
    t.decimal  "eps_2",                         precision: 10, scale: 2
    t.decimal  "eps_3",                         precision: 10, scale: 2
    t.decimal  "eps_4",                         precision: 10, scale: 2
    t.decimal  "fixed_charge_coverage_ratio_0", precision: 10, scale: 2
    t.decimal  "fixed_charge_coverage_ratio_1", precision: 10, scale: 2
    t.decimal  "fixed_charge_coverage_ratio_2", precision: 10, scale: 2
    t.decimal  "fixed_charge_coverage_ratio_3", precision: 10, scale: 2
    t.decimal  "fixed_charge_coverage_ratio_4", precision: 10, scale: 2
    t.decimal  "interest_coverage_ratio_0",     precision: 10, scale: 2
    t.decimal  "interest_coverage_ratio_1",     precision: 10, scale: 2
    t.decimal  "interest_coverage_ratio_2",     precision: 10, scale: 2
    t.decimal  "interest_coverage_ratio_3",     precision: 10, scale: 2
    t.decimal  "interest_coverage_ratio_4",     precision: 10, scale: 2
    t.decimal  "return_on_asset_0",             precision: 10, scale: 2
    t.decimal  "return_on_asset_1",             precision: 10, scale: 2
    t.decimal  "return_on_asset_2",             precision: 10, scale: 2
    t.decimal  "return_on_asset_3",             precision: 10, scale: 2
    t.decimal  "return_on_asset_4",             precision: 10, scale: 2
    t.decimal  "return_on_equity_0",            precision: 10, scale: 2
    t.decimal  "return_on_equity_1",            precision: 10, scale: 2
    t.decimal  "return_on_equity_2",            precision: 10, scale: 2
    t.decimal  "return_on_equity_3",            precision: 10, scale: 2
    t.decimal  "return_on_equity_4",            precision: 10, scale: 2
    t.decimal  "debt_Ratio_0",                  precision: 10, scale: 2
    t.decimal  "debt_Ratio_1",                  precision: 10, scale: 2
    t.decimal  "debt_Ratio_2",                  precision: 10, scale: 2
    t.decimal  "debt_Ratio_3",                  precision: 10, scale: 2
    t.decimal  "debt_Ratio_4",                  precision: 10, scale: 2
    t.decimal  "current_ratio_0",               precision: 10, scale: 2
    t.decimal  "current_ratio_1",               precision: 10, scale: 2
    t.decimal  "current_ratio_2",               precision: 10, scale: 2
    t.decimal  "current_ratio_3",               precision: 10, scale: 2
    t.decimal  "current_ratio_4",               precision: 10, scale: 2
    t.decimal  "debt_equity_ratio_0",           precision: 10, scale: 2
    t.decimal  "debt_equity_ratio_1",           precision: 10, scale: 2
    t.decimal  "debt_equity_ratio_2",           precision: 10, scale: 2
    t.decimal  "debt_equity_ratio_3",           precision: 10, scale: 2
    t.decimal  "debt_equity_ratio_4",           precision: 10, scale: 2
    t.decimal  "return_on_capital_employed_0",  precision: 10, scale: 2
    t.decimal  "return_on_capital_employed_1",  precision: 10, scale: 2
    t.decimal  "return_on_capital_employed_2",  precision: 10, scale: 2
    t.decimal  "return_on_capital_employed_3",  precision: 10, scale: 2
    t.decimal  "return_on_capital_employed_4",  precision: 10, scale: 2
    t.decimal  "return_on_networth_0",          precision: 10, scale: 2
    t.decimal  "return_on_networth_1",          precision: 10, scale: 2
    t.decimal  "return_on_networth_2",          precision: 10, scale: 2
    t.decimal  "return_on_networth_3",          precision: 10, scale: 2
    t.decimal  "return_on_networth_4",          precision: 10, scale: 2
    t.decimal  "assets_turnover_ratio_0",       precision: 10, scale: 2
    t.decimal  "assets_turnover_ratio_1",       precision: 10, scale: 2
    t.decimal  "assets_turnover_ratio_2",       precision: 10, scale: 2
    t.decimal  "assets_turnover_ratio_3",       precision: 10, scale: 2
    t.decimal  "assets_turnover_ratio_4",       precision: 10, scale: 2
  end

  add_index "ratios_and_analyses", ["nse_script_name"], name: "index_ratios_and_analyses_on_nse_script_name"

  create_table "script_meta_data", force: :cascade do |t|
    t.string   "isi_num",                                       null: false
    t.integer  "bse_script_numb",                               null: false
    t.string   "nse_script_name",                               null: false
    t.string   "company_display_name",                          null: false
    t.string   "financial_page_link"
    t.string   "balance_sheet_link"
    t.string   "p_l_link"
    t.string   "company_home_page"
    t.decimal  "f2_week_low",          precision: 10, scale: 2
    t.decimal  "f2_week_high",         precision: 10, scale: 2
    t.decimal  "number_of_shares",     precision: 10, scale: 2
    t.string   "industry"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.decimal  "graham_fvp",           precision: 10, scale: 2
    t.decimal  "eps",                  precision: 10, scale: 2
    t.decimal  "book_value",           precision: 10, scale: 2
    t.string   "nse_hist_tbl_name"
    t.string   "bse_hist_tbl_name"
  end

  add_index "script_meta_data", ["bse_script_numb"], name: "index_script_meta_data_on_bse_script_numb"
  add_index "script_meta_data", ["company_display_name"], name: "index_script_meta_data_on_company_display_name"
  add_index "script_meta_data", ["isi_num"], name: "index_script_meta_data_on_isi_num", unique: true
  add_index "script_meta_data", ["nse_script_name"], name: "index_script_meta_data_on_nse_script_name"

  create_table "users", force: :cascade do |t|
    t.string   "name",                    default: "", null: false
    t.string   "username",                default: "", null: false
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",         default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "gender"
    t.string   "occupation"
    t.integer  "income_Group"
    t.float    "investment_in_shares"
    t.integer  "age"
    t.boolean  "post_on_social_site"
    t.string   "expertize_level"
    t.boolean  "questionnaire_attempted"
    t.text     "portfolio"
    t.boolean  "premum_user"
    t.integer  "mobile_number"
    t.boolean  "mobile_verified"
    t.boolean  "sms_subscription"
    t.date     "date_of_birth"
    t.string   "hometown"
    t.string   "current_timezone"
    t.string   "picture"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
