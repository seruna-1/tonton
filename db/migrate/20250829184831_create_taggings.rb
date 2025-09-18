class CreateTaggings < ActiveRecord::Migration[8.0]
	def change
		create_table :page_taggings do |t|
			t.belongs_to :page
			t.belongs_to :tag
			t.timestamps
		end

		create_table :participator_taggings do |t|
			t.belongs_to :participator
			t.belongs_to :tag
			t.timestamps
		end
	end
end
