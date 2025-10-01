class ApplicationController < ActionController::Base
	include Authentication
	# Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
	allow_browser versions: :modern

	class << self
		attr_reader :repository_url

		attr_reader :repository_path

		attr_reader :collaborations_root

		attr_reader :valid_collaboration_file_extensions
	end

	@repository_url = "https://github.com/seruna-1/tonton-repo.git"

	@repository_path = Rails.root + "repository"

	@collaborations_root = @repository_path + "colab"

	@valid_collaboration_file_extensions = [ ".md", ".adoc" ]
end
