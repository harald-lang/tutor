class CreateExamTasks < ActiveRecord::Migration[5.0]
	def change
		create_table :exam_tasks do |t|
			t.integer :exam_id
			t.integer :number
			t.string :name
			t.integer :max_points
			t.timestamps
		end
	    add_index :exam_tasks, :exam_id
	end
end
