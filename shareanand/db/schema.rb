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

ActiveRecord::Schema.define(version: 20150412034816) do

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

  create_table "day_tradings", force: :cascade do |t|
    t.string   "isi_num",                                    null: false
    t.string   "nse_script_name",                            null: false
    t.decimal  "today_open",        precision: 10, scale: 2
    t.decimal  "today_high",        precision: 10, scale: 2
    t.decimal  "today_close",       precision: 10, scale: 2
    t.decimal  "pre_day_close",     precision: 10, scale: 2
    t.integer  "tot_shares_traded"
    t.decimal  "perc_change",       precision: 5,  scale: 2
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.decimal  "today_low",         precision: 10, scale: 2
  end

  add_index "day_tradings", ["nse_script_name"], name: "index_day_tradings_on_nse_script_name"

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

  create_table "script_meta_data", force: :cascade do |t|
    t.string   "isi_num",                                            null: false
    t.integer  "bse_script_numb",                                    null: false
    t.string   "nse_script_name",                                    null: false
    t.string   "money_control_script_name",                          null: false
    t.string   "financial_page_link"
    t.string   "balance_sheet_link"
    t.string   "p_l_link"
    t.string   "money_control_link"
    t.decimal  "f2_week_low",               precision: 10, scale: 2
    t.decimal  "f2_week_high",              precision: 10, scale: 2
    t.decimal  "market_cap",                precision: 10, scale: 2
    t.integer  "number_of_shares"
    t.string   "industry"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "script_meta_data", ["bse_script_numb"], name: "index_script_meta_data_on_bse_script_numb"
  add_index "script_meta_data", ["isi_num"], name: "index_script_meta_data_on_isi_num", unique: true
  add_index "script_meta_data", ["money_control_script_name"], name: "index_script_meta_data_on_money_control_script_name"
  add_index "script_meta_data", ["nse_script_name"], name: "index_script_meta_data_on_nse_script_name"

end
