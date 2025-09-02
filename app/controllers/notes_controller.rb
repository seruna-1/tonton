require "pandoc-ruby"

require "perfect_toml"

class NotesController < ApplicationController
	allow_unauthenticated_access only: %i[ show ]

	def index
	end

	def show
		@relative_path = request.path # /colab/...

		@real_path = Rails.root.to_s + "/repository" + request.path

		@toml = nil

		if @real_path.end_with?(".md")
			@toml = PerfectTOML.load_file( @real_path.sub( ".md", ".toml" ) )
		end

		if @toml
			@tags = @toml["tags"]
			@contributors = @toml["contributors"]
		end
	end
end
