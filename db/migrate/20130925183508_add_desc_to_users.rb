class AddDescToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :desc, :text
  end
end
