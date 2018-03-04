class ChangeAssessment < ActiveRecord::Migration[5.0]
  def change
  	remove_column :assessments, :week
  	add_column :assessments, :week_id, :integer
  end
end
