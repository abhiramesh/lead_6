class RegistrationController < Devise::RegistrationsController

	def create
    @user = User.create(:ip => request.remote_ip, :campaign => request.original_url.split('utm_campaign=').last)
    if params["user"]["age"]
      @user.age = params["user"]["age"]
      @user.save!
    end
    sign_in @user
  end
    

end
