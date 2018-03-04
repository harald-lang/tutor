class AddRoom < ActiveRecord::Migration[5.0]
  def change
  	add_column :groups, :room, :string
  end
end
