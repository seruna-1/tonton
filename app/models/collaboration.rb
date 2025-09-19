class Collaboration < ApplicationRecord
	has_many :collaboration_participations

	has_many :participators, through: :collaboration_participations

	has_many :collaboration_taggings

	has_many :tags, through: :collaboration_taggings
end
