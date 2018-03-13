Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  post "/users" => 'users#create'

  get "/services" => 'services#index'

  get "/mental_health_services" => 'mental_health_services#index'
  post "/mental_health_services" => 'mental_health_services#create'
  get "/mental_health_services/:id" => 'mental_health_services#show'
  patch "/mental_health_services/:id" => 'mental_health_services#update'
  delete "/mental_health_services/:id" => 'mental_health_services#destroy'

  get "/shelters" => 'shelters#index'
  post "/shelters" => 'shelters#create'
  get "/shelters/:id" => 'shelters#show'
  patch "/shelters/:id" => 'shelters#update'
  delete "/shelters/:id" => 'shelters#destroy'

  get "/law_services" => 'law_services#index'
  post "/law_services" => 'law_services#create'
  get "/law_services/:id" => 'law_services#show'
  patch "/law_services/:id" => 'law_services#update'
  delete "/law_services/:id" => 'law_services#destroy'

  get "/user_services" => 'user_services#index'
  post "/user_services" => 'user_services#create'

end
