class ChangeNumberofshares < ActiveRecord::Migration
 def self.up
 	change_table :script_meta_data do |t|
      t.change :number_of_shares, :decimal, :precision => 10, :scale => 2
    end
    change_table :day_tradings do |t|
       t.change :tot_outstanding_shares, :decimal, :precision => 10, :scale => 2
    end
     
  end
  def self.down
    change_table :script_meta_data do |t|
      t.change :number_of_shares, :integer
    end
    change_table :day_tradings do |t|
      t.change :tot_outstanding_shares, :integer
    end
  end
end

