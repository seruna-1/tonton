require "rugged"

class ManagementController < ApplicationController
	@@repository_path = Rails.root.to_s + "/repository"

	@@repository_url = "https://github.com/seruna-1/tonton-repo.git"

	def show
	end

	def remove
		puts "Removing repository."

		`rm -rf #{@@repository_path}`

		redirect_to repository_path
	end

	def pull_changes
		puts "Updating repository"

		if not Dir.exist?(@@repository_path) then Dir.mkdir(@@repository_path) end

		cloned = false

		begin
			repository = Rugged::Repository.new(@@repository_path)
		rescue Rugged::RepositoryError
			if not cloned
				puts "Cloning repository"

				Rugged::Repository.clone_at( @@repository_url, @@repository_path )

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
			puts `cd #{@@repository_path} && git merge origin/main`
		end

		redirect_to repository_path
	end
end
