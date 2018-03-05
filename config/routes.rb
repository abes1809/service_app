Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  post "/users" => 'users#create'

  get "/services" => 'services#index'

  post "/mental_health_services" => 'mental_health_services#create'
  get "/mental_health_services/:id" => 'mental_health_services#show'
  patch "/mental_health_services/:id" => 'mental_health_services#update'
  delete "/mental_health_services/:id" => 'mental_health_services#destroy'

  post "/shelters" => 'shelters#create'
  get "/shelters/:id" => 'shelters#show'
  patch "/shelters/:id" => 'shelters#update'
  delete "/shelters/:id" => 'shelters#destroy'

  post "/law_services" => 'law_services#create'
  get "/law_services/:id" => 'law_services#show'
  patch "/law_services/:id" => 'law_services#update'
  delete "/law_services/:id" => 'law_services#destroy'

  post "/user_services" => 'user_services#create'

end
