Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
	get "up" => "rails/health#show", as: :rails_health_check

	root "home#show"

	get "/group", to: "group#show_main_staff"

	get "/group/:username", to: "group#show_person"

	get "/repository", to: "repository#show"

	post "/repository", to: "repository#update"

	delete "/repository", to: "repository#remove"

	#get "/colaboration", to: "colaboration#index"

	#get "/colaboration/:material_name", to: "colaboration#show_material"
end
