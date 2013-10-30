class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :edit, :update, :results, :extra_info, :extra_info_2]

  require 'mechanize'
  require 'geokit'
  require 'area'

  # GET /users
  # GET /users.json
  def index
    @users = User.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # def csvi
  #   @users = User.first(10)
  #     send_data User.to_csv
  # end

  def results
    @users = User.all.sort
  end

  # def checkzip
  #   # geo = GeoKit::Geocoders::MultiGeocoder.multi_geocoder(params["zipcode"])
  #   #   if geo.success
  #   #     render json: "yes".to_json
  #   #   else
  #   #     render json: "no".to_json
  #   #   end

  #   if params["zipcode"].length == 5 && params["zipcode"].to_region != nil
  #     render json: "yes".to_json
  #   else
  #     render json: "no".to_json
  #   end

  # end

  def extra_info
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def extra_info_2
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if params["user"] && params["user"]["business_name"]
      @user.business_name = params["user"]["business_name"]
      @user.save!
    end
    if params["user"] && params["user"]["bank"]
      @user.bank = params["user"]["bank"]
      @user.save!
    end
    if params["user"] && params["user"]["state"]
      @user.state = params["user"]["state"]
      @user.save!
    end
      if @user.update_attributes(params[:user])
        if @user.name && @user.email && @user.phone && @user.state && @user.business_name && @user.bank
          if @user.campaign.to_s.downcase.include? "vinny"
            lead_src = "PUJ"
          elsif @user.campaign == "other"
            lead_src = "REV"
          else
            lead_src = "RAW"
          end
          a = Mechanize.new
          url = "https://leads.leadtracksystem.com/genericPostlead.php"
              params = {
                "TYPE" => '105',
                "SRC" => "PujVA",
                "Trusted_Form" => @user.trusted,
                "Landing_Page" => "amp1",
                "IP_Address" => "75.2.92.149",
                "First_Name" => @user.name.split(' ')[0],
                "Last_Name" => @user.name.split(' ')[1],
                "Business_Name" => @user.business_name,
                "State" => @user.state,
                "Email" => @user.email,
                "Day_Phone" => @user.phone,
                "Evening_Phone" => @user.phone,
                "Pub_ID" => lead_src,
                "Have_2_Months_Bank_Statements" => @user.bank
              }
          response = a.post(url, params)
          puts d = Nokogiri::XML(response.content)
          @user.lead = d.xpath("//lead_id").text
          @user.save!
          redirect_to '/logout'
      else
        redirect_to '/logout'
      end
    else
      redirect_to '/logout'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
