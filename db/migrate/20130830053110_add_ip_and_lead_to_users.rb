class AddIpAndLeadToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ip, :string
  	add_column :users, :lead, :string
  end
end
