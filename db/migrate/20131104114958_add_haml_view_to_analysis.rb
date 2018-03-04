class AddHamlViewToAnalysis < ActiveRecord::Migration[5.0]
  def change
  	add_column :analyses, :view, :text
  end
end
