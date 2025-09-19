class CreateTaggings < ActiveRecord::Migration[8.0]
	def change
		create_join_table :collaborations, :tags, table_name: :collaboration_taggings

		create_join_table :participators, :tags, table_name: :participator_taggings
	end
end
