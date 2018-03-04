class AddGroupToAssessment < ActiveRecord::Migration[5.0]
  def change
  	add_column :assessments, :group_id, :integer
  end
end
