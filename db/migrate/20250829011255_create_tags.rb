class CreateTags < ActiveRecord::Migration[8.0]
	def change
		create_table :tags do |t|
			t.string :name
			t.string :directory_path
			t.timestamps
		end
	end
end
