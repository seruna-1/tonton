class CreateParticipations < ActiveRecord::Migration[8.0]
	def change
		create_join_table :participators, :collaborations, table_name: :collaboration_participations
	end
end
