# require 'unirest'

# response = Unirest.get("https://data.cityofchicago.org/resource/62iq-5k5u.json")
# all_services = response.body 

# shelters = all_services.select{|service| service['program_model'] == "Interim Housing" || service['program_model'] =="Homeless Youth Overnight Shelter: Low-Threshold"}.select{|service| service['division'] == "Homeless Services"}

# shelters = shelters.uniq{|shelter| shelter["agency"]}

#   contact_info = ContactInfo.create!(
#                                     phone_number: "773-890-9681",
#                                     address: "5052 S. laflin",
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: "60609",
#                                     website: "http://ycmi.publishpath.com/about-us",
#                                     email: "You can email this service at http://ycmi.publishpath.com/about-us."
#                                     )

#   shelter = Shelter.create!(
#                    name: "You Can Make It",
#                    specialty: "Emergency Shelter for men, women, and children",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "dependents",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )


#   # ___________________________________________

#   contact_info = ContactInfo.create!(
#                                     phone_number: "773-533-0254",
#                                     address: "200 S Sacramento Blvd, suite 400",
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: "60612",
#                                     website: "http://www.thejoshuaministries.org/",
#                                     email: "N/A"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Joshua Ministries Shelter",
#                    specialty: "Emergency shelter for men",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "gender",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: "'2' || '4'",
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#     # ___________________________________________

#   contact_info = ContactInfo.create!(
#                                     phone_number: "773-346-1785",
#                                     address: "402 N St Louis Ave",
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: "60624",
#                                     website: "http://www.breakthrough.org/",
#                                     email: "N/A"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Breakthrough Urban Ministries Men's Services",
#                    specialty: "Emergency Shelter for men",
#                    contact_info_id: contact_info.id
#                    )


#   Qualifier.create!(
#                   name: "gender",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: "2",
#                   data_form: "integer",
#                   comparison: "=="
#                   )
#    Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
  
#     # ___________________________________________


#   contact_info = ContactInfo.create!(
#                                     phone_number: "773-567-1317",
#                                     address: "332 S Michigan Ave, Suite 1032",
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: "60604",
#                                     website: "http://www.darkimincnfp.com/",
#                                     email: "N/A"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Darkim Responsible Living For Women Inc Nfps",
#                    specialty: "Emergency Shelter for women",
#                    contact_info_id: contact_info.id
#                    )


#   Qualifier.create!(
#                   name: "gender",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: "'1' || '3' || '5' ",
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )

# # __________________________

#   contact_info = ContactInfo.create!(
#                                     phone_number: "773-778-2811",
#                                     address: "5756 s wood",
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: "60629",
#                                     website: "N/A",
#                                     email: "N/A"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Inner Peace Corp",
#                    specialty: "Women's recovery home and shelter",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "gender",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: "'1' || '3'",
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )

#     # ___________________________________________

#   contact_info = ContactInfo.create!(
#                                     phone_number: "773-244-6401",
#                                     address: "4410 N. Ravenswood, Suite 101 ",
#                                     state: "IL",
#                                     city: "Chicago",
#                                     zip: "60640",
#                                     website: "http://www.northsidehousing.org/uptown-men-s-shelter",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "North Side Housing and Supportive Services ",
#                    specialty: "Transitional Housing for Men",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "gender",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: "'2' || '4'",
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )

#     # ___________________________________________


#   contact_info = ContactInfo.create!(
#                                     phone_number: "708-338-1724 ext. 228",
#                                     address: "405 S. Euclid Ave.",
#                                     state: "IL",
#                                     city: "Oak Park",
#                                     zip: "60301",
#                                     website: "https://www.housingforward.org/get-help",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Housing Forward - Euclid United Methodist Church ONLY ON SUNDAYS",
#                    specialty: "Emergency shelter for adult men women ",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "photo_id",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#     # ________________
#   # need photo ID
#     # ___________________________________________

#     contact_info = ContactInfo.create!(
#                                     phone_number: "708-338-1724 ext. 228",
#                                     address: "848 W. Lake Street",
#                                     state: "IL",
#                                     city: "Oak Park",
#                                     zip: "60301",
#                                     website: "https://www.housingforward.org/get-help",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Housing Forward - First United Church of Oak Park ONLY ON MONDAYS",
#                    specialty: "Emergency shelter for adult men women",
#                    contact_info_id: contact_info.id
#                    )
#   Qualifier.create!(
#                   name: "photo_id",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#   # need photo ID
#     # ___________________________________________
#     contact_info = ContactInfo.create!(
#                                     phone_number: "708-338-1724 ext. 228",
#                                     address: "1235 N. Harlem Ave",
#                                     state: "IL",
#                                     city: "Oak Park",
#                                     zip: "60301",
#                                     website: "https://www.housingforward.org/get-help",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Housing Forward - Oak Park Temple ONLY ON TUESDAYS",
#                    specialty: "Emergency shelter for adult men women",
#                    contact_info_id: contact_info.id
#                    )
#   Qualifier.create!(
#                   name: "photo_id",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#   # need photo ID
#     # ___________________________________________

#     contact_info = ContactInfo.create!(
#                                     phone_number: "708-338-1724 ext. 228",
#                                     address: "924 W. Lake Street",
#                                     state: "IL",
#                                     city: "Oak Park",
#                                     zip: "60301",
#                                     website: "https://www.housingforward.org/get-help",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Housing Forward - Grace Episcopal Church ONLY ON WEDNESDAYS",
#                    specialty: "Emergency shelter for adult men women",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "photo_id",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#   # need photo ID
#     # ___________________________________________

#     contact_info = ContactInfo.create!(
#                                     phone_number: "708-338-1724 ext. 228",
#                                     address: "924 W. Lake Street",
#                                     state: "IL",
#                                     city: "Oak Park",
#                                     zip: "60301",
#                                     website: "https://www.housingforward.org/get-help",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Housing Forward - Grace Episcopal Church ONLY ON THURSDAYS",
#                    specialty: "Emergency shelter for adult men women",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "photo_id",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#   # need photo ID
#     # ___________________________________________

#     contact_info = ContactInfo.create!(
#                                       phone_number: "708-338-1724 ext. 228",
#                                       address: "545 S. East Ave",
#                                       state: "IL",
#                                       city: "Oak Park",
#                                       zip: "60301",
#                                       website: "https://www.housingforward.org/get-help",
#                                       email: "support@northsidehousing.org"
#                                       )

#     shelter = Shelter.create!(
#                      name: "Housing Forward - St. Christopher's Episcopal Church ONLY ON FRIDAYS",
#                      specialty: "Emergency shelter for adult men women",
#                      contact_info_id: contact_info.id
#                      )

#     Qualifier.create!(
#                     name: "photo_id",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: true,
#                     data_form: "boolean",
#                     comparison: "=="
#                     )
#     Qualifier.create!(
#                       name: "age",
#                       servicable_id: shelter.id, 
#                       servicable_type: "Shelter",
#                       target_value: 18,
#                       data_form: "integer",
#                       comparison: ">"
#                       )
#     # need photo ID
#       # ___________________________________________

#     contact_info = ContactInfo.create!(
#                                     phone_number: "708-338-1724 ext. 228",
#                                     address: "1428 S. Wesley Ave",
#                                     state: "IL",
#                                     city: "Berwyn",
#                                     zip: "60402",
#                                     website: "https://www.housingforward.org/get-help",
#                                     email: "support@northsidehousing.org"
#                                     )

#   shelter = Shelter.create!(
#                    name: "Housing Forward - St. Christopher's Episcopal Church ONLY ON SATURDAYS",
#                    specialty: "Emergency shelter for adult men women",
#                    contact_info_id: contact_info.id
#                    )

#   Qualifier.create!(
#                   name: "photo_id",
#                   servicable_id: shelter.id, 
#                   servicable_type: "Shelter",
#                   target_value: true,
#                   data_form: "boolean",
#                   comparison: "=="
#                   )
#   Qualifier.create!(
#                     name: "age",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: 18,
#                     data_form: "integer",
#                     comparison: ">"
#                     )
#   # need photo ID
#     # ___________________________________________

#       contact_info = ContactInfo.create!(
#                                       phone_number: "773-271-8163",
#                                       address: "4628 N Clifton Ave",
#                                       state: "IL",
#                                       city: "Chicago",
#                                       zip: "60640",
#                                       website: "http://www.ccolife.org/our-programs/our-shelters-for-individuals/",
#                                       email: "N/A"
#                                       )

#     shelter = Shelter.create!(
#                      name: "Cornerstone Community Outreach",
#                      specialty: "Emergency shelter for adult men women",
#                      contact_info_id: contact_info.id
#                      )

#     Qualifier.create!(
#                     name: "photo_id",
#                     servicable_id: shelter.id, 
#                     servicable_type: "Shelter",
#                     target_value: true,
#                     data_form: "boolean",
#                     comparison: "=="
#                     )
#     Qualifier.create!(
#                       name: "age",
#                       servicable_id: shelter.id, 
#                       servicable_type: "Shelter",
#                       target_value: 18,
#                       data_form: "integer",
#                       comparison: ">"
#                       )
#     # need photo ID
#       # ___________________________________________

#         contact_info = ContactInfo.create!(
#                                         phone_number: "708-354-0858",
#                                         address: "145 N. Waiola Avenue",
#                                         state: "IL",
#                                         city: "Chicago",
#                                         zip: "60640",
#                                         website: "http://www.beds-plus.org/shelters.html",
#                                         email: "N/A"
#                                         )

#       shelter = Shelter.create!(
#                        name: "BEDS Plus",
#                        specialty: "Emergency shelter for adult men and women",
#                        contact_info_id: contact_info.id
#                        )

#       Qualifier.create!(
#                         name: "age",
#                         servicable_id: shelter.id, 
#                         servicable_type: "Shelter",
#                         target_value: 18,
#                         data_form: "integer",
#                         comparison: ">"
#                         )


#         # ___________________________________________

#           contact_info = ContactInfo.create!(
#                                           phone_number: "773-651-8372",
#                                           address: "7320 S. Yale Avenue",
#                                           state: "IL",
#                                           city: "Chicago",
#                                           zip: "60621",
#                                           website: "http://margaretsvillage.org/",
#                                           email: "N/A"
#                                           )

#         shelter = Shelter.create!(
#                          name: "Margaret's Village",
#                          specialty: "Transitional shelter for women, children, and families",
#                          contact_info_id: contact_info.id
#                          )

#         Qualifier.create!(
#                         name: "gender",
#                         servicable_id: shelter.id, 
#                         servicable_type: "Shelter",
#                         target_value: "'1' || '3'",
#                         data_form: "boolean",
#                         comparison: "=="
#                         )
#         Qualifier.create!(
#                         name: "dependents",
#                         servicable_id: shelter.id, 
#                         servicable_type: "Shelter",
#                         target_value: true,
#                         data_form: "boolean",
#                         comparison: "=="
#                         )


#           # ___________________________________________

#       contact_info = ContactInfo.create!(
#                                           phone_number: "773-264-5332",
#                                           address: "11321 South Wentworth Ave",
#                                           state: "IL",
#                                           city: "Chicago",
#                                           zip: "60628",
#                                           website: "http://www.alboh.org/",
#                                           email: "N/A"
#                                           )

#       shelter =  Shelter.create!(
#                          name: "A Little Bit of Heaven Homeless Mens Overnight Shelter",
#                          specialty: "Emergency shelter for men",
#                          contact_info_id: contact_info.id
#                          )

#       Qualifier.create!(
#                       name: "gender",
#                       servicable_id: shelter.id, 
#                       servicable_type: "Shelter",
#                       target_value: "'2' || '4'",
#                       data_form: "boolean",
#                       comparison: "=="
#                       )


#       Qualifier.create!(
#                         name: "age",
#                         servicable_id: shelter.id, 
#                         servicable_type: "Shelter",
#                         target_value: 18,
#                         data_form: "integer",
#                         comparison: ">"
#                         )

#           # ___________________________________________

#         contact_info = ContactInfo.create!(
#                                           phone_number: "773-264-5332",
#                                           address: "11321 South Wentworth Ave",
#                                           state: "IL",
#                                           city: "Chicago",
#                                           zip: "60628",
#                                           website: "http://www.alboh.org/",
#                                           email: "N/A"
#                                           )

#        shelter = Shelter.create!(
#                          name: "The Ark Men",
#                          specialty: "Emergency shelter for men",
#                          contact_info_id: contact_info.id
#                          )


#        Qualifier.create!(
#                        name: "gender",
#                        servicable_id: shelter.id, 
#                        servicable_type: "Shelter",
#                        target_value: "2",
#                        data_form: "boolean",
#                        comparison: "=="
#                        )

#           # ___________________________________________

#         contact_info = ContactInfo.create!(
#                                           phone_number: "847-297-8540",
#                                           address: "1440 Renaissance",
#                                           state: "IL",
#                                           city: "Park Ridge",
#                                           zip: "60068",
#                                           website: "http://theharbour.org/index.html",
#                                           email: "You can email this service at http://theharbour.org/contact.html"
#                                           )

#        shelter = Shelter.create!(
#                          name: "The Ark Women",
#                          specialty: "Shelter for young women age 12-21",
#                          contact_info_id: contact_info.id
#                          )

#        Qualifier.create!(
#                        name: "gender",
#                        servicable_id: shelter.id, 
#                        servicable_type: "Shelter",
#                        target_value: "1",
#                        data_form: "boolean",
#                        comparison: "=="
#                        )
#        Qualifier.create!(
#                          name: "age",
#                          servicable_id: shelter.id, 
#                          servicable_type: "Shelter",
#                          target_value: 22,
#                          data_form: "integer",
#                          comparison: "<"
#                          )

#           # ___________________________________________


#       contact_info = ContactInfo.create!(
#                                          phone_number: "312-649-4111",
#                                          address: " 213 West Institute Place, Suite 403",
#                                          state: "IL",
#                                          city: "Chicago",
#                                          zip: "60610",
#                                          website: "https://law-arts.org/contact-us",
#                                          email: "nschonitzer@law-arts.org"
#                                          )

#       law_service = LawService.create!(
#                                       name: "Lawyers for the Creative Arts",
#                                       specialty: "LCA advises clients in the full array of legal issues that they encounter such as: Corporate and general business matters; Copyright, trademark, and patents; Rights clearance and fair use; Contract drafting, review, and negotiation; Dispute resolution and litigation; Nonprofit formation and tax exemption; Rights of privacy and publicity; Visa and immigration; Landlord-tenant; Employment",
#                                       contact_info_id: contact_info.id
#                                       )

#       Qualifier.create!(
#                         name: "annual_income",
#                         servicable_id: law_service.id, 
#                         servicable_type: "LawService",
#                         target_value: "8060 + (user.household_size * 4000)",
#                         data_form: "integer",
#                         comparison: "<="
#                         )
#           # ___________________________________________

#     contact_info = ContactInfo.create!(
#                                        phone_number: "773-583-9191",
#                                        address: "3507 W Lawrence Chicago",
#                                        state: "IL",
#                                        city: "Chicago",
#                                        zip: "60625",
#                                        website: "https://worldreliefchicago.org/immigrant-legal-services",
#                                        email: "You can call this service at: https://worldreliefchicago.org/contact"
#                                        )

#     law_service = LawService.create!(
#                                     name: "World Relief Chicago",
#                                     specialty: "Immigration legal services",
#                                     contact_info_id: contact_info.id
#                                     )
#           # ___________________________________________

#           contact_info = ContactInfo.create!(
#                                              phone_number: "773-583-9191",
#                                              address: "315 S. Plymouth Court",
#                                              state: "IL",
#                                              city: "Chicago",
#                                              zip: "60604",
#                                              website: "https://www.jmls.edu/clinics/",
#                                              email: "N/A"
#                                              )

#           law_service = LawService.create!(
#                                           name: "The John Marshall Legal Clinic",
#                                           specialty: "Low cost/free legal services for buissness litigation, domestic violence, fair housing, and human right",
#                                           contact_info_id: contact_info.id
#                                           )
#         Qualifier.create!(
#                           name: "annual_income",
#                           servicable_id: law_service.id, 
#                           servicable_type: "LawService",
#                           target_value: "8060 + (user.household_size * 4000)",
#                           data_form: "integer",
#                           comparison: "<="
#                           )
#           # ___________________________________________

#           contact_info = ContactInfo.create!(
#                                              phone_number: "312-738-9200",
#                                              address: "",
#                                              state: "IL",
#                                              city: "Chicago",
#                                              zip: "60604",
#                                              website: "https://www.carpls.org/client-services/",
#                                              email: "N/A"
#                                              )

#           law_service = LawService.create!(
#                                           name: "CARPLS",
#                                           specialty: "Legal advice - lawyers will tell you where to call",
#                                           contact_info_id: contact_info.id
#                                           )
# # ________________

#           contact_info = ContactInfo.create!(
#                                              phone_number: "N/A",
#                                              address: "",
#                                              state: "IL",
#                                              city: "Chicago",
#                                              zip: "60604",
#                                              website: "https://www.illinoislegalaid.org/get-legal-help",
#                                              email: "N/A"
#                                              )

#           law_service = LawService.create!(
#                                           name: "Illinois Legal Aid Online",
#                                           specialty: "Must apply online to be connected with their legal help.",
#                                           contact_info_id: contact_info.id
#                                           )
# # ________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "N/A",
#                                    address: "",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60604",
#                                    website: "https://www.illinoislegalaid.org/get-legal-help",
#                                    email: "N/A"
#                                    )

# law_service = LawService.create!(
#                                 name: "Illinois Legal Aid Foundation",
#                                 specialty: "General legal services, must apply online.",
#                                 contact_info_id: contact_info.id
#                                 )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: law_service.id, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )

# # ________________


# contact_info = ContactInfo.create!(
#                                    phone_number: "N/A",
#                                    address: "",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60604",
#                                    website: "https://www.illinoislegalaid.org/get-legal-help",
#                                    email: "N/A"
#                                    )

# law_service = LawService.create!(
#                                 name: "Justice Entrepreneurs Project",
#                                 specialty: "Probono legal services to people in the following areas: Family Law – including divorce, spousal support, child support, custody, visitation and orders of protection Landlord/Tenant – including eviction proceedings and security deposit claims Consumer Law – including debt collection issues, consumer disputes and Chapter 7 bankruptcy Estate Law – including wills, probate and guardianships, Employment Law – including discrimination and wage claims, Small Business/Non-profit – including business formation, contracts and intellectual property issues, Real Property Law – including foreclosure proceedings and real estate purchase/sale, Criminal misdemeanors, traffic tickets, license suspensions and ordinance violations, Immigration Law – including visas, residency, naturalization and asylum",
#                                 contact_info_id: contact_info.id
#                                 )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: law_service.id, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "312-660-1370",
#                                    address: "208 S. LaSalle St., Suite 1300",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60604",
#                                    website: "http://www.immigrantjustice.org/services/general-immigration",
#                                    email: "immigrantlegaldefense@heartlandalliance.org"
#                                    )

# law_service = LawService.create!(
#                                 name: "National Immigrant Justice Center",
#                                 specialty: "Immigrant legal services including: Eligible youth (DREAMers) seeking to apply for deferred action (DACA) and employment authorization. Immigrants applying for permanent residence through a family-based application. Permanent residents applying for citizenship. Immigrants who are victims of domestic violence or violent crime and seek protection in the United States. Victims of international human trafficking. Immigrants applying for Temporary Protect Status or NACARA.",
#                                 contact_info_id: contact_info.id
#                                 )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: law_service.id, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "312-906-5013",
#                                    address: "208 S. LaSalle St., Suite 1300",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60604",
#                                    website: "https://www.kentlaw.iit.edu/seeking-legal-help",
#                                    email: "lawoffices@kentlaw.iit.edu"
#                                    )

# law_service = LawService.create!(
#                                 name: "The Law Offices of Chicago-Kent",
#                                 specialty: "client legal services in the following practice areas - please note that all of the attorneys charge legal fees for their services: Criminal Defense Litigation, Plaintiffs Employment Discrimination, Civil Rights Litigation, Entrepreneurial Law, Family Law, Vaccine Injury Law Project, Open Government, Tax Law.",
#                                 contact_info_id: contact_info.id
#                                 )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: " 312-915-7830",
#                                    address: "25 E. Pearson Street",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60611",
#                                    website: "https://www.luc.edu/law/academics/experientiallearning/liveclientexperiences/clinicalprograms/communitylawcenterclinic/",
#                                    email: "N/A"
#                                    )

# law_service = LawService.create!(
#                                 name: "School of Law Community Law Center Clinic",
#                                 specialty: "Low cost general legal services",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: law_service.id, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "312-347-7600",
#                                    address: "33 North LaSalle, Suite 900",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60602",
#                                    website: "http://lcbh.org/get-legal-help/getting-help-with-LCBH",
#                                    email: "N/A"
#                                    )

# law_service = LawService.create!(
#                                 name: "Lawyer's Committee for Better Housing",
#                                 specialty: "Low cost to free legal services for chicago residents experiencing Eviction, A building foreclosure, Housing discrimination, Unsafe apartment conditions, such as bed bugs, mold or lead paint, An unresponsive landlord, Utility shut-off by your landlord, Issues with your landlord requiring the help of an attorney",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: law_service.id, 
#                   servicable_type: "LawService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "312-252-9500",
#                                    address: "50 E. Washington St.",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60602",
#                                    website: "https://www.cathedralcounseling.org/how-we-can-help-you/fees-and-insurance/",
#                                    email: "N/A"
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "Cathedral Counseling Center",
#                                 specialty: "Cathedral Counseling Center offers a range of affordable psychotherapy and psychiatric services to help people struggling with mental health issues like mood disorders, trauma, or grief.",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "insurance",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: true,
#                   data_form: "integer",
#                   comparison: "=="
#                   )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "847-733-4300",
#                                    address: " 8 S. Michigan Ave.",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60602",
#                                    website: "https://www.family-institute.org/therapists-locations/chicago",
#                                    email: "N/A"
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "The Family Institute a Northwestern",
#                                 specialty: "Sliding scale therapy services for people experiencing a wide range of mental health chanllenges. General fee is $85-$100",
#                                 contact_info_id: contact_info.id
#                                 )
# #LOW COST
# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "773-883-9100",
#                                    address: "4081 North Broadway",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60613",
#                                    website: "http://aihschgo.org/program/2/behavioral-health",
#                                    email: "info@aihschgo.org"
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "American Indian Health Services",
#                                 specialty: "Sliding scale individual, family, and group therapy. Typical cost is $10-$50. Services are free for Native Americans (must show tribal documents).",
#                                 contact_info_id: contact_info.id
#                                 )
# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )

# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "312-666-3494",
#                                    address: "4747 North Kedzie Avenue",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60613",
#                                    website: "www.eriefamilyhealth.org/locations/erie-helping-handshealth-center",
#                                    email: "complaint@jointcommission.org"
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "Erie Family Health Centers",
#                                 specialty: "Sliding scale individual, family, and group therapy. Typical cost is $30-$60.",
#                                 contact_info_id: contact_info.id
#                                 )
# Qualifier.create!(
#                   name: "insurance",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: true,
#                   data_form: "integer",
#                   comparison: "=="
#                   )

# #LOW COST
# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "773-843-3001",
#                                    address: "3860 W Ogden Ave",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60623",
#                                    website: "https://www.lawndale.org/service/behavioral-health",
#                                    email: "info@lawndale.org "
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "Lawndale Christian Health Center",
#                                 specialty: "Sliding scale individual, family, and group therapy. Typical cost is $15-$45. Must provide pay stubs and tax income to qualiy for sliding scale costs",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# #LOW COST
# # _______________________________


# contact_info = ContactInfo.create!(
#                                    phone_number: "773-843-3001",
#                                    address: "1029 E 130th St, Chicago",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60628",
#                                    website: "https://www.lawndale.org/service/behavioral-health",
#                                    email: "info@lawndale.org "
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "TCA Health",
#                                 specialty: "Sliding scale individual, family, and group therapy. Typical cost is $15-$45.",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# #LOW COST
# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "773-843-3001",
#                                    address: "1920 N. Hamlin Ave",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60647",
#                                    website: "www.circlefamilycare.org/contact-us/14-cfhcn/6-hamlin-health-center.html",
#                                    email: "N/A"
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "Hamlin Health Center",
#                                 specialty: "Sliding scale individual, family, and group therapy. Typical cost is $0-$80.",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# #LOW COST
# # _______________________________

# contact_info = ContactInfo.create!(
#                                    phone_number: "773-843-3001",
#                                    address: "4753 North Broadway",
#                                    state: "IL",
#                                    city: "Chicago",
#                                    zip: "60640",
#                                    website: "https://www.ahschicago.org/behavioral-health/",
#                                    email: "N/A"
#                                    )

# mental_health_service = MentalHealthService.create!(
#                                 name: "Asian Health Services",
#                                 specialty: "Sliding scale individual, family, and group therapy. Typical cost is $0-$80.",
#                                 contact_info_id: contact_info.id
#                                 )

# Qualifier.create!(
#                   name: "annual_income",
#                   servicable_id: mental_health_service.id, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "8060 + (user.household_size * 4000)",
#                   data_form: "integer",
#                   comparison: "<="
#                   )
# #LOW COST
# # _______________________________












# # # law_services = all_services.select{|service| service['program_model'] == "Domestic Violence Legal Clinic" || service['program_model'] == "Legal Advocacy and Case Management" || service['program_model'] == "Legal Services" || service['program_model'] == "Legal Services for Victims of Domestic Violence" ||service['program_model'] == "Legal Services"}

# # # law_services = law_services.uniq{|law_service| law_service["agency"]}

# # # law_services.each do |law_service|
# # #   contact_info = ContactInfo.create!(
# # #                                     phone_number: law_service["phone_number"],
# # #                                     address: law_service["address"],
# # #                                     state: "IL",
# # #                                     city: "Chicago",
# # #                                     zip: law_service["zip"],
# # #                                     )

# # #   LawService.create!(
# # #                    name: law_service["agency"],
# # #                    specialty: law_service["program_model"],
# # #                    contact_info_id: contact_info.id
# # #                    )

# # # end




# # # mental_health_services = all_services.select{|service| service['program_model'] == "Behavioral Health Support (At-Risk Youth)" || service['program_model'] == "Counseling and Case Management Services"}

# # # mental_health_services = mental_health_services.uniq{|mental_health_service| mental_health_service["agency"]}


# # # mental_health_services.each do |mental_health_service|
# # #   contact_info = ContactInfo.create!(
# # #                                     phone_number: mental_health_service["phone_number"],
# # #                                     address: mental_health_service["address"],
# # #                                     state: "IL",
# # #                                     city: "Chicago",
# # #                                     zip: mental_health_service["zip"],
# #                                     )

# #   MentalHealthService.create!(
# #                    name: mental_health_service["agency"],
# #                    specialty: mental_health_service["program_model"],
# #                    contact_info_id: contact_info.id
# #                    )

# # end


# # Qualifier.create!(
# #                   name: "domestic_violence_survivor",
# #                   servicable_id: 17, 
# #                   servicable_type: "LawService",
# #                   target_value: "true",
# #                   data_form: "boolean",
# #                   comparison: "=="
# # #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 1, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 2, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 10, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 11, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 16, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 18, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 19, 
# #                   servicable_type: "LawService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 2, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 3, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 279, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 280, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 11, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 12, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 288, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 291, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 292, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
# #                   )
# # Qualifier.create!(
# #                   name: "annual_income",
# #                   servicable_id: 293, 
# #                   servicable_type: "MentalHealthService",
# #                   target_value: "8060 + (user.household_size * 4000)",
# #                   data_form: "integer",
# #                   comparison: "<="
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





# Qualifier.create!(
#                   name: "zip",
#                   servicable_id: 13, 
#                   servicable_type: "MentalHealthService",
#                   target_value: "",
#                   data_form: "integer",
#                   comparison: "=="
#                   )













