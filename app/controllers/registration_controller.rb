class RegistrationController < Devise::RegistrationsController

	def create
    if request.referer.to_s.downcase.include? "vinny"
      campaign = request.referer.split('.com/').last
    else
      campaign = "other"
    end
    if params["user"] && params["user"]["email"]
      email = params["user"]["email"]
    end
    if params["user"] && params["user"]["phone"]
      phone = params["user"]["phone"]
    end
    if params["first_name"] && params["last_name"]
      name = params["first_name"] + " " + params["last_name"]
    end
    if params["xxTrustedFormCertUrl"]
      trusted = params["xxTrustedFormCertUrl"]
    end
    @user = User.create(:ip => request.remote_ip, :campaign => campaign, :name => name, :email => email, :phone => phone, :trusted => trusted)
    sign_in @user
    respond_to do |format|
      format.html { redirect_to '/'}
      format.js
    end
  end
    

end
