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

		begin
			repository = Rugged::Repository.new(@@path)
		rescue Rugged::RepositoryError
			puts "Cloning repository"

			Rugged::Repository.clone_at( @@url, @@path )

			repository = Rugged::Repository.new(@@path)

			cloned = true
		end

		if not cloned
			puts "Pulling changes"

			remote = repository.remotes["origin"]

			remote.fetch

			repository.merge_commits(
				repository.head.target,

				repository.branches["origin/main"].target
			)
		end

		redirect_to repository_path
	end
end
