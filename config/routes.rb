Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
	get "up" => "rails/health#show", as: :rails_health_check

	get "/", to: "home#show"

	get "/group", to: "group#show"
end
