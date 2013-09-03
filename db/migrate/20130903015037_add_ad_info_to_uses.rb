class AddAdInfoToUses < ActiveRecord::Migration
  def change
  	add_column :users, :campaign, :string
  end
end
