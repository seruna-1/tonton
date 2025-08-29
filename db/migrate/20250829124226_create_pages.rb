class CreatePages < ActiveRecord::Migration[8.0]
	def change
		create_table :pages do |t|
			t.string :path

			t.string :title

			t.timestamps
		end


	end
end
