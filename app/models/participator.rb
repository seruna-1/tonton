require "perfect_toml"

class Participator < ApplicationRecord
	has_many :participator_taggings

	has_many :tags, through: :participator_taggings

	has_many :collaboration_participations

	has_many :collaborations, through: :collaboration_participations

	has_one :participator_user

	has_one :user

	def directory_name

		Pathname.new(self.directory_path).each_filename.to_a.last

	end

end
