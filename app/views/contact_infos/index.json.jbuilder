json.array! @contact_infos.each do |contact_info|
  
  json.id contact_info.id 
  json.email contact_info.email
  json.phone_number contact_info.phone_number
  json.address contact_info.address
  json.city contact_info.city 
  json.state contact_info.state
  json.zip contact_info.zip
  json.prefered_contact_method contact_info.prefered_contact_method

end 