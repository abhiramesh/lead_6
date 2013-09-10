class RegistrationController < Devise::RegistrationsController

	def create
    if request.referer.to_s.downcase.include? "vinny"
      campaign = request.referer.split('utm_campaign=').last
    else
      campaign = "other"
    end
    @user = User.create(:ip => request.remote_ip, :campaign => campaign)
    if params["user"]["age"]
      @user.age = params["user"]["age"]
      @user.save!
    end
    sign_in @user
  end
    

end
