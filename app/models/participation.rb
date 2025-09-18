class Participation < ApplicationRecord
	belongs_to :tag
	belongs_to :participator

	def generate
		Dir.new("")
	end
end
