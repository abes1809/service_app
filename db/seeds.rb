
# ContactInfo.create!([
#                     {email: "intakes@cgla.net",phone_number: "312-738-2452",address: "740 N. Milwaukee Ave",city: "Chicago",state: "IL",zip: "60642",prefered_contact_method: 1},
#                     {email: "http://www.clclaw.org/contact.aspx",phone_number: "773-731-1762 ",address: "2938 E. 91st Street",city: "Chicago",state: "IL",zip: "60617",prefered_contact_method: 2},
#                     {email: "sheats.wlsc@gmail.com",phone_number: "312-332-2222",address: "105 W Madison St Ste 1300",city: "Chicago",state: "IL",zip: "60602",prefered_contact_method: 2},
#   ])

# LawService.create!([
#                     {name: "Cabrini Green Legal Aid", contact_info_id: 1, specialty: "Low-income legal representation"},
#                     {name: "Chicago Legal Clinic", contact_info_id: 2, specialty: "Low-income legal representation"},
#                     {name: "Women's Legal Services Center", contact_info_id: 3, specialty: "Family Law/Divorce"}
#   ])

ContactInfo.create!([
                    {email: "http://www.wildflowerllc.com/contact/",phone_number: "312-809-0298",address: "820 N. Orleans Street Suite 206",city: "Chicago",state: "IL",zip: "60610",prefered_contact_method: 2},
                    {email: nil,phone_number: "773-388-1600",address: "6500 N. Clark Street",city: "Chicago",state: "IL",zip: "60626",prefered_contact_method: 2},
                    {email: "intake@thresholds.org",phone_number: "773-572-5500",address: "4101 N. Ravenswood Ave.",city: "Chicago",state: "IL",zip: "60613",prefered_contact_method: 2},
  ])

MentalHealthService.create!([
                              {name: "Wildflower Center for Emotional Help", contact_info_id: 4, specialty: "General mental health counseling services"},
                              {name: "Howard Brown Health Center", contact_info_id: 5, specialty: "General mental health counseling services & LGBTQ couseling"},
                              {name: "Thresholds", contact_info_id: 6, specialty: "A variety of mental health services including outpaitent counseling, and community reintegreation for folks with mental illness."},
  ])