require 'mechanize'
require 'json'

a = Mechanize.new

url = "https://leads.leadtracksystem.com/genericPostlead.php"

params = {
	"TYPE" => '85',
	"Test_Lead" => "1",
	"SRC" => 'PujiiTestSite',
	"Landing_Page" => "amp1",
	"IP_Address" => "75.2.92.149",
	"First_Name" => "Bob",
	"Last_Name" => "Bob",
	"State" => "PA",
	"Zip" => "33444",
	"Email" => "test@test.com",
	"Day_Phone" => "444-555-6655",
	"Age" => "50",
	"Employment_Status" => "Making less than $1500 per month",
	"Medical_Status" => "Yes",
	"Representation_Status" => "Yes",
	"Unsecured Debt" => "Yes, I need debt help",
	"Student Loans" => "Yes, I need student debt help"
}

response = a.post(url, params)

d = Nokogiri::XML(response.content)
puts d.xpath("//lead_id").text
