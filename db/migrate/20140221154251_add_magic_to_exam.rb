class AddMagicToExam < ActiveRecord::Migration[5.0]
  def change
  	add_column :exams, :magictoken, :string
  end
end
