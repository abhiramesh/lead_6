class RegistrationController < Devise::RegistrationsController

	def create
    if request.referer.to_s.downcase.include? "vinny"
      campaign = request.referer.split('.com/').last
    else
      campaign = "other"
    end
    @user = User.create(:ip => request.remote_ip, :campaign => campaign)
    if params["user"]["age"]
      @user.age = params["user"]["age"]
      @user.save!
    end
    sign_in @user
#    render json: "signedin".to_json
  end
    

end
