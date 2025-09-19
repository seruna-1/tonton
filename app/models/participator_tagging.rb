class ParticipatorTagging < ApplicationRecord
	belongs_to :participator

	belongs_to :tag
end
