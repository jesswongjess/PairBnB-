Rails.application.routes.draw do
  root 'welcome#index'
  get 'braintree/new'
  post 'braintree/checkout'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root 'static#home'
  # if you are using Clearance gem, $ all clearance:routes
  #it will generate signin, signup and logout path in session controller
  # also generate password path.
  # redirect to homepage
  resources :listings do
    resources :bookings, only: [:create, :new, :show]
  end

  resources :tags
get "/auth/:provider/callback" =>"sessions#create_form_omniauth"


  # callback URL, URL that redirects the user from Facebook to your app
end
