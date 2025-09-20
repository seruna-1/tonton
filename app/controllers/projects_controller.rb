require "pandoc-ruby"

class ProjectsController < ApplicationController
	allow_unauthenticated_access only: %i[ show ]

	def show
		@root_directory_path = Rails.root + "repository/projects" + params[:name]

		if not @root_directory_path.exist?
			relative_path = Pathname.new("repository/projects") + params[:name]

			raise ActionController::RoutingError.new "Project not found at path #{relative_path}"
		end

		@bulletin_path = @root_directory_path + "bulletin"

		if not @root_directory_path.exist?
			@bulletin_path = nil
		end
	end
end
