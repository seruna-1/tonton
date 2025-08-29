class CreatePageTaggings < ActiveRecord::Migration[8.0]
	def change
		create_table :page_taggings do |t|
			t.belongs_to :page
			t.belongs_to :tag
			t.timestamps
		end
	end
end
