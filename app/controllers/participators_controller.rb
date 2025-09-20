require "perfect_toml"
require "cgi"

class ParticipatorsController < ApplicationController
	allow_unauthenticated_access only: %i[ index show ]

	def index
	end

	def show
		@participator = Participator.find_by name: CGI.unescapeURIComponent(params[:name])

		@names = []
		@links = []

		begin
			if @participator.directory_path != ""
				@toml = PerfectTOML.load_file( Rails.root + @participator.directory_path + "about.toml" )
			end
		rescue
			@toml = nil
		else
			@names = @toml["names"]
			@links = @toml["links"]
		end
	end
end
