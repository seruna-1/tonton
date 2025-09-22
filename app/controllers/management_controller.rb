require "rugged"

class ManagementController < ApplicationController

	@@repository_path = Rails.root + "repository"

	@@repository_url = "https://github.com/seruna-1/tonton-repo.git"

	@@valid_collaboration_file_extensions = [ ".md", ".adoc" ]

	@@collaborations_root = @@repository_path + "colab"

	def show
	end

	def self.load_user_toml path

		toml = PerfectTOML.load_file path

		if existent = Participator.find_by name: toml["names"].first

			puts "Updating record for #{toml["names"].first}"

			Participator.update! directory_path: directory_path

		else

			puts "Creating record for #{toml["names"].first} with a directory path at #{author_file}"

			#Participator.create!( name: toml["names"].first, directory_path: directory_path )

		end

	end

	def self.load_collaboration_toml path

		toml = PerfectTOML.load_file path

		for name in toml["contributors"]

			if not Participator.find_by name: name

				puts "Creating record for #{name} without a directory path"

				#Participator.create! name: name, directory_path: ""

			end

		end

	end

	def self.recompile

		for string in Dir.glob( Rails.root.to_s + "/repository/colab/**/*" )

			path = Pathname.new(string)

			if path.extname == ".toml" then ManagementController.load_collaboration_toml path

			elsif @@valid_collaboration_file_extensions.include? path.extname

				relative_path_name = path.relative_path_from(@@collaborations_root).to_s

				if not Collaboration.exists?( path: relative_path_name ) then Collaboration.create!( path: relative_path_name ) end

			end

		end

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

		redirect_to management_path
	end
end
