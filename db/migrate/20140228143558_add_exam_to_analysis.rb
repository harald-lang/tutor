class AddExamToAnalysis < ActiveRecord::Migration[5.0]
  def change
  	add_column :analyses, :exam, :boolean, :default => false
  end
end
