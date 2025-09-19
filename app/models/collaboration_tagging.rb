class CollaborationTagging < ApplicationRecord
	belongs_to :collaboration

	belongs_to :tag
end
