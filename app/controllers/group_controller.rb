class GroupController < ApplicationController
	allow_unauthenticated_access only: %i[ show_main_staff show_person ]

	def show_main_staff
	end

	def show_person
		@user_name = params[:username]
	end
end
