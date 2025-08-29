class Page < ApplicationRecord
	has_many :page_taggings
	has_many :tags, through: :page_taggings
end
