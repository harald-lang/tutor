class AddWeekAssoc < ActiveRecord::Migration[5.0]
  def change
  	add_column :weeks, :course_id, :integer
  end
end
