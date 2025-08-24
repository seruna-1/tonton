require "kramdown"

class NotesController < ApplicationController
	def index
	end

	def show
		@relative_path = request.path # /colab/...

		@real_path = Rails.root.to_s + "/repository" + request.path
	end
end
