# json.partial! @user_service, partial: "user_service", as: :user_service 

json.id @user_service[0]["id"]
json.servicable_type @user_service[0]["servicable_type"]
json.status @user_service[0]["status"]
json.notes @user_service[0]["notes"]

json.name @user_service[1]["name"]
json.speciality @user_service[1]["specialty"]
json.email @user_service[1].contact_info.email
json.phone_number @user_service[1].contact_info.phone_number
json.address @user_service[1].contact_info.address
json.city @user_service[1].contact_info.city
json.state @user_service[1].contact_info.state
json.website @user_service[1].contact_info.website
json.prefered_contact @user_service[0]['prefered_contact_method']
json.status @user_service[0]["status"]
