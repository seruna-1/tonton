class CollaborationParticipation < ApplicationRecord
	belongs_to :collaboration

	belongs_to :participator
end
