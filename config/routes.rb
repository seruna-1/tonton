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

	get "/colab/index", to: "collaborations#index"

	post "/colab/index", to: "collaborations#index"

	get "/colab/*", to: "collaborations#show"

	get "/project/", to: "projects#index"

	get "/project/:name", to: "projects#show"
end
