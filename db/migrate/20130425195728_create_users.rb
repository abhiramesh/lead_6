class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :phone
      t.string :ip
      t.string :lead
      t.string :campaign
      t.string :trusted
      t.string :business_name
      t.string :state
      t.timestamps
    end
  end
end
