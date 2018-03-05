require 'unirest'

response = Unirest.get("https://data.cityofchicago.org/resource/62iq-5k5u.json")

all_services = response.body 

# shelters = all_services.select{|service| service['program_model'] == "Interim Housing" || service['program_model'] =="Homeless Youth Overnight Shelter: Low-Threshold"}.select{|service| service['division'] == "Homeless Services"}

# shelters = shelters.uniq{|shelter| shelter["agency"]}

# shelters.each do |shelter|
#   puts
#   puts "Name: #{shelter["agency"]}"
#   puts "Service type: #{shelter["division"]}"
#   puts "Progam: #{shelter["program_model"]}"
#   puts "Phone Number: #{shelter["phone_number"]}"
#   puts "Address: #{shelter["address"]},#{shelter["zip"]}"

#   puts "______________________________________"
# end 

# law_services = all_services.select{|service| service['program_model'] == "Domestic Violence Legal Clinic" || service['program_model'] == "Legal Advocacy and Case Management" || service['program_model'] == "Legal Services" || service['program_model'] == "Legal Services for Victims of Domestic Violence" ||service['program_model'] == "Legal Services"}

# # law_services = law_services.uniq{|law_service| law_service["agency"]}

# law_services.each do |law_service|
#   puts
#   puts "Name: #{law_service["agency"]}"
#   puts "Service type: #{law_service["division"]}"
#   puts "Progam: #{law_service["program_model"]}"
#   puts "Phone Number: #{law_service["phone_number"]}"
#   puts "Address: #{law_service["address"]},#{law_service["zip"]}"

#   puts "______________________________________"
# end 

mental_health_services = all_services.select{|service| service['program_model'] == "Behavioral Health Support (At-Risk Youth)" || service['program_model'] == "Counseling and Case Management Services"}

mental_health_services = mental_health_services.uniq{|mental_health_service| mental_health_service["agency"]}

mental_health_services.each do |mental_health_service|
  puts
  puts "Name: #{mental_health_service["agency"]}"
  puts "Service type: #{mental_health_service["division"]}"
  puts "Progam: #{mental_health_service["program_model"]}"
  puts "Phone Number: #{mental_health_service["phone_number"]}"
  puts "Address: #{mental_health_service["address"]},#{mental_health_service["zip"]}"

  puts "______________________________________"
end 

# dv_shelters = []
# shelters = Shelter.all 

# shelters.each do |shelter|
#   if shelter.name.include?("women")
#     dv_shelters << shelter 
#   end 
# end 
# p dv_shelters









