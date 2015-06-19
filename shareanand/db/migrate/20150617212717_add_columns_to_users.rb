class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :gender, :string
  	add_column :users, :occupation, :string
  	add_column :users, :income_Group, :integer
  	add_column :users, :investment_in_shares, :float
	add_column :users, :age, :integer
	add_column :users, :post_on_social_site, :boolean 
	add_column :users, :expertize_level, :string 
	add_column :users, :questionnaire_attempted , :boolean
	add_column :users, :portfolio, :text 
	add_column :users, :premum_user , :boolean
	add_column :users, :mobile_number, :integer
	add_column :users, :mobile_verified, :boolean
	add_column :users, :sms_subscription, :boolean
	add_column :users, :date_of_birth, :date
	add_column :users, :hometown, :string
	add_column :users, :current_timezone, :string
	add_column :users, :picture, :string
  end
end
