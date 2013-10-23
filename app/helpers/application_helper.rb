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

	def veteran_options
		[
			["Active Duty", "Active Duty"],
			["Veteran", "Veteran"],
			["Retired Military", "Retired Military"],
		]
	end

	def employment_options
		[
			["Yes", "Making less than $1500 per month"],
			["No", "Making over than $1500 per month"]
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

	def previous_options
		[
			["No", "No"],
			["Yes, claim pending", "Yes, claim pending"],
			["Yes, receiving benefits", "Yes, receiving benefits"],
			["Yes, claim denied", "Yes, claim denied"],
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

	def desc_options
		[
			["Arthritis", "Arthritis"],
			["Autism Spectrum", "Autism Spectrum"],
			["Back Injury", "Back Injury"],
			["Bipolar", "Bipolar"],
			["Brain Injury", "Brain Injury"],
			["Byetta", "Byetta"],
			["Cancer", "Cancer"],
			["Chronic Fatigue", "Chronic Fatigue"],
			["Depression", "Depression"],
			["Diabetes", "Diabetes"],
			["Fibromyalgia", "Fibromyalgia"],
			["Granuflo illness", "Granuflo illness"],
			["Head Injury", "Head Injury"],
			["Hearing Related", "Hearing Related"],
			["Heart Condition", "Heart Condition"],
			["Herniated Disc", "Herniated Disc"],
			["HIV Aids", "HIV Aids"],
			["Lipitor", "Lipitor"],
			["Loss of Limb", "Loss of Limb"],
			["Mesothelioma", "Mesothelioma"],
			["Nuerological", "Nuerological"],
			["Ocella", "Ocella"],
			["Orthopedic", "Orthopedic"],
			["Psychological", "Psychological"],
			["Ruptured Disc", "Ruptured Disc"],
			["Skin Disease", "Skin Disease"],
			["Sleep Apnea", "Sleep Apnea"],
			["Stroke Related", "Stroke Related"],
			["Transvaginal Mesh", "Transvaginal Mesh"],
			["Vision Related", "Vision Related"],
			["Yasmin", "Yasmin"],
			["Yaz", "Yaz"],
			["Other/Not Listed", "Other/Not Listed"]
		]
	end

end
