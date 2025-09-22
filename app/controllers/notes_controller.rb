require "pandoc-ruby"

require "perfect_toml"

class NotesController < ApplicationController
	allow_unauthenticated_access only: %i[ index show ]

	def index
	end

	def show
		@relative_path = request.path

		@real_path = Rails.root + "/repository" + request.path

		case @extension
		when "md"
			@content = `pandoc "#{@real_path}" -t html --section-divs`
		when "adoc"
			@content = `asciidoctor -o - "#{@real_path}"`
		else
			raise ActionController::RoutingError.new("Collaboration not found at path #{@relative_path}. No extension error.")
		end

		begin
			@toml = PerfectTOML.load_file( @real_path.sub_ext( ".toml" ) )
		rescue
			@toml = nil
		else
			@tags = @toml["tags"]

			@contributors = @toml["contributors"]
		end
	end
end
