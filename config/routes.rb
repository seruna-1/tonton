Rails.application.routes.draw do
	resource :session

	resources :passwords, param: :token

	get "up" => "rails/health#show", as: :rails_health_check

	root "home#show"

	get "/participators", to: "participators#index"

	get "/participators/:name", to: "participators#show"

	get "/management", to: "management#show"

	post "/repository", to: "management#pull_changes"

	delete "/repository", to: "management#remove_repository"

	get "/colab", to: "notes#show"

	get "/colab/*", to: "notes#show"
end
