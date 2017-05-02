Rails.application.routes.draw do
  root 'static#home'
  # redirect to homepage
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # callback URL, URL that redirects the user from Facebook to your app
end
