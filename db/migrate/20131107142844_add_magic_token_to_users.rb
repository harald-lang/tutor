class AddMagicTokenToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :magictoken, :string
  end
end
