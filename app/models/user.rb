class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me, :name, :email, :phone, :lead, :ip, :campaign, :trusted, :state, :business_name, :bank, :age


  # def self.to_csv
  #   CSV.generate(col_sep: "\t") do |csv|
  #     csv << ["Name", "Email", "Phone", "Campaign"]
  #     all.each do |user|
  #     	row = []
  #       row << user.name
  #       row << user.email
  #       row << user.phone
  #       row << user.campaign
  #       csv << row
  #     end
  #   end
  # end

end
