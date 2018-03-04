class AddCourseToExams < ActiveRecord::Migration[5.0]
  def change
  	add_column :exams, :course_id, :integer
  	add_index :exams, :course_id
  end

end
