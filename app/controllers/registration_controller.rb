class RegistrationController < Devise::RegistrationsController

	def create
    @user = User.create(:ip => request.remote_ip)
    if params["user"]["age"]
      @user.age = params["user"]["age"]
      @user.save!
    end
    sign_in @user
  end
    

end
