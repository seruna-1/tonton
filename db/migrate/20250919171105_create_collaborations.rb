class CreateCollaborations < ActiveRecord::Migration[8.0]
	def change
		create_table :collaborations do |t|
			t.string :path
			t.timestamps
		end
	end
end
