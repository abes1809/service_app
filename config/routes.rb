Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  post "/users" => 'users#create'

  get "/contact_infos" => 'contact_infos#index'
  post "/contact_infos" => 'contact_infos#create'
  delete "/contact_infos/:id" => 'contact_infos#destroy'

  get "/services" => 'services#index'
  post "/services" => 'services#create'
  get "/services/:category/:id" => 'services#show'
  patch "/services/:category/:id" => 'services#update'
  delete "/services/:category/:id" => 'services#destroy'

end
