require "pandoc-ruby"

class NotesController < ApplicationController
	allow_unauthenticated_access only: %i[ show ]

	def index
	end

	def show
		@relative_path = request.path # /colab/...

		@real_path = Rails.root.to_s + "/repository" + request.path
	end
end
