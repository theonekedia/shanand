class CreateRatiosAndAnalyses < ActiveRecord::Migration
  def change
    create_table :ratios_and_analyses do |t|
		t.string	:industry
		t.string	:isi_num,	null: false 
		t.string	:nse_script_name, null: false 

		t.timestamps null: false
    end
  end
end
