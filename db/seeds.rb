# require 'unirest'

# response = Unirest.get("https://data.cityofchicago.org/resource/62iq-5k5u.json")
# all_services = response.body 

# shelters = all_services.select{|service| service['program_model'] == "Interim Housing" || service['program_model'] =="Homeless Youth Overnight Shelter: Low-Threshold"}.select{|service| service['division'] == "Homeless Services"}

# shelters = shelters.uniq{|shelter| shelter["agency"]}

# shelters.each do |shelter|
#   contact_info = ContactInfo.create!(
#                                     phone_number: shelter["phone_number"],
#                                     address: shelter["address"],
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: shelter["zip"],
#                                     )

#   Shelter.create!(
#                    name: shelter["agency"],
#                    specialty: shelter["program_model"],
#                    contact_info_id: contact_info.id
#                    )

# end



# law_services = all_services.select{|service| service['program_model'] == "Domestic Violence Legal Clinic" || service['program_model'] == "Legal Advocacy and Case Management" || service['program_model'] == "Legal Services" || service['program_model'] == "Legal Services for Victims of Domestic Violence" ||service['program_model'] == "Legal Services"}

# law_services = law_services.uniq{|law_service| law_service["agency"]}

# law_services.each do |law_service|
#   contact_info = ContactInfo.create!(
#                                     phone_number: law_service["phone_number"],
#                                     address: law_service["address"],
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: law_service["zip"],
#                                     )

#   LawService.create!(
#                    name: law_service["agency"],
#                    specialty: law_service["program_model"],
#                    contact_info_id: contact_info.id
#                    )

# end




# mental_health_services = all_services.select{|service| service['program_model'] == "Behavioral Health Support (At-Risk Youth)" || service['program_model'] == "Counseling and Case Management Services"}

# mental_health_services = mental_health_services.uniq{|mental_health_service| mental_health_service["agency"]}


# mental_health_services.each do |mental_health_service|
#   contact_info = ContactInfo.create!(
#                                     phone_number: mental_health_service["phone_number"],
#                                     address: mental_health_service["address"],
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: mental_health_service["zip"],
#                                     )

#   MentalHealthService.create!(
#                    name: mental_health_service["agency"],
#                    specialty: mental_health_service["program_model"],
#                    contact_info_id: contact_info.id
#                    )

# end


# Qualifier.create!(
#                   name: "domestic_violence_survivor",
#                   servicable_id: 17, 
#                   servicable_type: "LawService",
#                   target_value: "true",
#                   data_form: "boolean",
#                   comparison: "=="
# #                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 1, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 2, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 10, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 11, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 16, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 18, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 19, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 2, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 3, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 279, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 280, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 11, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 12, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 288, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 291, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 292, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: 293, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 275, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 276, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 277, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 279, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 281, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 283, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 286, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 289, 
#                   servicable_type: "MentalHealthService",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 15, 
#                   servicable_type: "Shelter",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: ">="
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 7, 
#                   servicable_type: "Shelter",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: ">="
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 13, 
#                   servicable_type: "Shelter",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )
# Qualifier.create!(
#                   name: "age",
#                   servicable_id: 29, 
#                   servicable_type: "Shelter",
#                   target_value: 18,
#                   data_form: "integer",
#                   comparison: "<"
#                   )

Qualifier.create!(
                  name: "zip",
                  servicable_id: 13, 
                  servicable_type: "MentalHealthService",
                  target_value: "",
                  data_form: "integer",
                  comparison: "=="
                  )













