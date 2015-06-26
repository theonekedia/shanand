class AddEpsToDayTradings < ActiveRecord::Migration
  def change
  	tables = [:day_tradings,:script_meta_data]
  	tables.each do |table_name|
    add_column table_name, :graham_fvp, :decimal, :precision => 10, :scale => 2
    add_column table_name, :eps, :decimal, :precision => 10, :scale => 2
    add_column table_name, :book_value, :decimal, :precision => 10, :scale => 2
	end
  end
end
