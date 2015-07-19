class AddIndustryToDayTrading < ActiveRecord::Migration
  def change
    add_column :day_tradings, :industry, :string
  end
end
