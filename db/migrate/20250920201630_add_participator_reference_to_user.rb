class AddParticipatorReferenceToUser < ActiveRecord::Migration[8.0]
	def change
		add_reference :users, :participator, foreign_key: true
	end
end
