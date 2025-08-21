require "kramdown"

class HomeController < ApplicationController
	allow_unauthenticated_access only: %i[ show ]

	def show
		@md_path = Rails.root + "repo/personal/seruna/readme.md"
	end
end
