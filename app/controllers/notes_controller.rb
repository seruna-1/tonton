require "pandoc-ruby"

require "perfect_toml"

class NotesController < ApplicationController
	allow_unauthenticated_access only: %i[ index show ]

	def index
	end

	def search
		params.require(:term)

		@search_results = Collaboration.where("path LIKE ?", "%#{params[:term]}%")
	end

	def show
		@real_path = Rails.root + ( "repository" + CGI.unescape(request.path) )

		@relative_path = @real_path.relative_path_from @@repository_path

		case @real_path.extname
		when ".md"
			@content = `pandoc "#{@real_path}" -t html --section-divs`
		when ".adoc"
			@content = `asciidoctor -o - "#{@real_path}"`
		else
			raise ActionController::RoutingError.new("Collaboration not found at path #{@relative_path}. No extension error.")
		end

		begin
			toml_path = @real_path.sub_ext( ".toml" )

			@toml = PerfectTOML.load_file toml_path
		rescue
			puts "No Toml file at #{toml_path}"

			@toml = nil
		else
			@tags = @toml["tags"]

			@contributors = @toml["contributors"]
		end
	end
end
