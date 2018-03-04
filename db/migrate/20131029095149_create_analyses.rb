class CreateAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :analyses do |t|
      t.string :name
      t.text :query
      t.boolean :admin

      t.timestamps
    end
  end
end
