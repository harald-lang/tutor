class AddSeatsToExam < ActiveRecord::Migration[5.0]
  def change
  	add_column :exams, :seat_assignment, :text
  end
end
