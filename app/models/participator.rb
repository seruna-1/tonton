require "perfect_toml"

class Participator < ApplicationRecord
	has_many :participator_taggings

	has_many :tags, through: :participator_taggings

	has_many :collaboration_participations

	has_many :collaborations, through: :collaboration_participations

	def directory_name
		Pathname.new(self.directory_path).each_filename.to_a.last
	end

	def self.extract_all
		author_files = Dir.glob( Rails.root.to_s + "/repository/contributors/**/about.toml" )

		for author_file in author_files
			directory_path = Pathname.new(author_file).parent
			toml = PerfectTOML.load_file(author_file)

			if existent = Participator.find_by(name: toml["names"].first)
				puts "Updating record for #{toml["names"].first}"

				Participator.update!( directory_path: directory_path )
			else
				puts "Creating record for #{toml["names"].first} with a directory path at #{author_file}"

				Participator.create!( name: toml["names"].first, directory_path: directory_path )
			end
		end

		page_files = Dir.glob( Rails.root.to_s + "/repository/colab/**/*.toml" );puts page_files

		for page_file in page_files
			toml = PerfectTOML.load_file(page_file)

			for contributor in toml["contributors"]
				if not Participator.find_by(name: contributor)
					puts "Creating record for #{contributor} without a directory path"

					Participator.create!( name: contributor, directory_path: "" )
				end
			end
		end
	end
end
