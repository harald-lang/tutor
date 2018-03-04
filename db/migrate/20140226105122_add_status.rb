class AddStatus < ActiveRecord::Migration[5.0]
  def change
  	add_column :exam_assessments, :status, :string
  end
end
