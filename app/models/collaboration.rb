require "perfect_toml"

class Collaboration < ApplicationRecord

	has_many :collaboration_participations

	has_many :participators, through: :collaboration_participations

	has_many :collaboration_taggings

	has_many :tags, through: :collaboration_taggings

	def process_toml

		toml_path = ApplicationController.collaborations_root + Pathname.new(self.path).sub_ext('.toml')

		toml = PerfectTOML.load_file(toml_path)

		return toml

	end

end
