class AddNewDetailsTousers < ActiveRecord::Migration
  def up
  	remove_column :users, :home_value
  	remove_column :users, :mortgage_balance
  	add_column :users, :age, :string
  	add_column :users, :employment, :string
  	add_column :users, :attorney, :string
  	add_column :users, :medical, :string
  end

  def down
  end
end
