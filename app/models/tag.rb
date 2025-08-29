class Tag < ApplicationRecord
	has_many :page_taggings
	has_many :pages, through: :page_taggings
end
