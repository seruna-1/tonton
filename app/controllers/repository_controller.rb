require "rugged"

class RepositoryController < ApplicationController
	@@path = Rails.root.to_s + "/repository"

	@@url = "https://github.com/seruna-1/tonton-repo.git"

	def show
	end

	def remove
		puts "Removing repository."

		`rm -rf #{@@path}`

		redirect_to repository_path
	end

	def update
		puts "Updating repository"

		if not Dir.exist?(@@path) then Dir.mkdir(@@path) end

		cloned = false

		begin
			repository = Rugged::Repository.new(@@path)
		rescue Rugged::RepositoryError
			if not cloned
				puts "Cloning repository"

				Rugged::Repository.clone_at( @@url, @@path )

				cloned = true

				retry
			else
				raise Error("Tried to clone repository, but still could not create an object of it.")
			end
		else
			puts "Pulling changes"

			remote = repository.remotes["origin"]

			puts "Checking connection to #{remote.url}."

			connection_ok = remote.check_connection(:fetch)

			if not connection_ok then raise Error("Connection not ok.") end

			puts "Fetching from #{remote.url}."

			remote.fetch

			puts "Merging."

			# Do this with rugged
			puts `cd #{@@path} && git merge origin/main`
		end

		redirect_to repository_path
	end
end
