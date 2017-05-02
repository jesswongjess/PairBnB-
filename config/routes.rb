Rails.application.routes.draw do
  root 'static#home'
  # redirect to homepage
  resources :listings #resouce gives id in rake routes; resources give user_id(param)
  resources :tags 

  resources :users do
    resources :listings
  end

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # callback URL, URL that redirects the user from Facebook to your app
end
