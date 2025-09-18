require "perfect_toml"

class ParticipatorsController < ApplicationController
	allow_unauthenticated_access only: %i[ index show ]

	def index
	end

	def show
		begin
			@toml = PerfectTOML.load_file( Rails.root.to_s + "/repository/contributors/#{params[:name]}/about.toml" )
		rescue
			raise ActionController::RoutingError.new("Not Found")
		end

		@names = @toml["names"]
		@links = @toml["links"]
		@record = Participator.find_by(name: @names.first)
	end
end
