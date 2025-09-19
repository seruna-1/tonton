class Tag < ApplicationRecord
	has_many :collaboration_taggings

	has_many :collaborations, through: :collaboration_taggings

	has_many :participator_taggings

	has_many :participators, through: :participator_taggings
end
