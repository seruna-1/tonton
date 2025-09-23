class ApplicationController < ActionController::Base
	include Authentication
	# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
	allow_browser versions: :modern

	@@repository_path = Rails.root + "repository"

	@@repository_url = "https://github.com/seruna-1/tonton-repo.git"
end
