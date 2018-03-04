class AddExprToExam < ActiveRecord::Migration[5.0]
  def change
  	add_column :exams, :expr, :text
  end
end
