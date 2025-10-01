require "pandoc-ruby"

require "perfect_toml"

class NotesController < ApplicationController
	allow_unauthenticated_access only: %i[ index show ]

	def index
		@search_results = Array.new()

		if params[:page]
			@search_page = params[:page].to_i
		else
			@search_page = 0
		end

		search_results_per_page = 30

		if request.get?
			offset = @search_page * search_results_per_page

			for collaboration in Collaboration.offset(offset).take(search_results_per_page)
				entry = collaboration.process_toml

				entry['path'] = collaboration.path

				@search_results << entry
			end
		elsif request.post?
			params.require(:term)

			offset = 0

			for collaboration in Collaboration.offset(offset).limit(search_results_per_page).where("path LIKE ?", "%#{params[:term]}%")
				entry = collaboration.process_toml

				entry['path'] = collaboration.path

				@search_results << entry
			end

			render status: :ok
		end
	end

	def show
		@real_path = Rails.root + ( "repository" + CGI.unescape(request.path) )

		@relative_path = @real_path.relative_path_from ApplicationController.repository_path

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
