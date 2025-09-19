class CreateParticipators < ActiveRecord::Migration[8.0]
	def change
		create_table :participators do |t|
			t.string :name, null: false
			t.string :directory_path
			t.timestamps
		end
	end
end
