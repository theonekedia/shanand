class CreateCashFlowStatements < ActiveRecord::Migration
  def change
    create_table :cash_flow_statements do |t|
    	t.string   "industry"
    	t.string   "isi_num",                                     null: false
    	t.string   "nse_script_name",                             null: false
    	t.string   "last_updated_year"

    	t.decimal  "net_profit_bfr_tax_0",      precision: 10, scale: 2
    	t.decimal  "net_profit_bfr_tax_1",      precision: 10, scale: 2
    	t.decimal  "net_profit_bfr_tax_2",      precision: 10, scale: 2
    	t.decimal  "net_profit_bfr_tax_3",      precision: 10, scale: 2
    	t.decimal  "net_profit_bfr_tax_4",      precision: 10, scale: 2

    	t.decimal  "net_cash_4m_operating_0",      precision: 10, scale: 2
    	t.decimal  "net_cash_4m_operating_1",      precision: 10, scale: 2
    	t.decimal  "net_cash_4m_operating_2",      precision: 10, scale: 2
    	t.decimal  "net_cash_4m_operating_3",      precision: 10, scale: 2
    	t.decimal  "net_cash_4m_operating_4",      precision: 10, scale: 2

    	t.decimal  "net_cash_investing_0",      precision: 10, scale: 2
    	t.decimal  "net_cash_investing_1",      precision: 10, scale: 2
    	t.decimal  "net_cash_investing_2",      precision: 10, scale: 2
    	t.decimal  "net_cash_investing_3",      precision: 10, scale: 2
    	t.decimal  "net_cash_investing_4",      precision: 10, scale: 2

    	t.decimal  "net_cash_financing_0",      precision: 10, scale: 2
    	t.decimal  "net_cash_financing_1",      precision: 10, scale: 2
    	t.decimal  "net_cash_financing_2",      precision: 10, scale: 2
    	t.decimal  "net_cash_financing_3",      precision: 10, scale: 2
    	t.decimal  "net_cash_financing_4",      precision: 10, scale: 2

    	t.decimal  "net_chng_in_cash_equivs_0",      precision: 10, scale: 2
    	t.decimal  "net_chng_in_cash_equivs_1",      precision: 10, scale: 2
    	t.decimal  "net_chng_in_cash_equivs_2",      precision: 10, scale: 2
    	t.decimal  "net_chng_in_cash_equivs_3",      precision: 10, scale: 2
    	t.decimal  "net_chng_in_cash_equivs_4",      precision: 10, scale: 2

    	t.decimal  "opening_cash_equivs_0",      precision: 10, scale: 2
    	t.decimal  "opening_cash_equivs_1",      precision: 10, scale: 2
    	t.decimal  "opening_cash_equivs_2",      precision: 10, scale: 2
    	t.decimal  "opening_cash_equivs_3",      precision: 10, scale: 2
    	t.decimal  "opening_cash_equivs_4",      precision: 10, scale: 2

    	t.decimal  "closing_cash_equivs_0",      precision: 10, scale: 2
    	t.decimal  "closing_cash_equivs_1",      precision: 10, scale: 2
    	t.decimal  "closing_cash_equivs_2",      precision: 10, scale: 2
    	t.decimal  "closing_cash_equivs_3",      precision: 10, scale: 2
    	t.decimal  "closing_cash_equivs_4",      precision: 10, scale: 2
    end
	add_index "cash_flow_statements", "nse_script_name" , name: "cash_flow_statements_on_nse_script_name", unique: true 
  end
end
