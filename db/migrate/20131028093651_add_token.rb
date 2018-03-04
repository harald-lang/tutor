class AddToken < ActiveRecord::Migration[5.0]
  def change
  	add_column :students, :token, :string
    add_index :students, :token, :unique => true
  end
end
