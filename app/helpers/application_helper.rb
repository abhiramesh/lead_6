module ApplicationHelper

	def resource_name
		:user
    end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end


	def age_options
		[
			["Under 18", "Under 18"],
		]
	end

	def employment_options
		[
			["Making less than $1500 per month", "Making less than $1500 per month"],
			["Making more than $1500 per month", "Making over than $1500 per month"]
		]
	end

	def medical_options
		[
			["Yes", "Yes"],
			["No", "No"]
		]
	end

	def attorney_options
		[
			["No", "No"],
			["Yes", "Yes"]
		]
	end

	def debt_options
		[
			["Yes, I need debt help", "Yes, I need debt help"],
			["No, I do not need help", "No, I do not need help"]
		]
	end

	def loan_options
		[
			["Yes, I need student debt help", "Yes, I need student debt help"],
			["No, I do not need student debt help", "No, I do not need student debt help"]
		]
	end

end
