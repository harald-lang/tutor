class AddExamsRooms < ActiveRecord::Migration[5.0]
  def change
  	create_table :exams_rooms do |t|
  	  t.integer :exam_id
  	  t.integer :room_id
      t.timestamps
    end
    add_index :exams_rooms, :exam_id
    add_index :exams_rooms, :room_id  
  end
end
