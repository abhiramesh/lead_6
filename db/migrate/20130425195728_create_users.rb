class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string :zipcode
    	t.string :home_value
    	t.string :mortgage_balance
    	t.string :name
    	t.string :email
    	t.string :phone
      t.timestamps
    end
  end
end
