class RenameStartBack < ActiveRecord::Migration[5.0]
  def change
  	rename_column :groups,:starttime,:start
  end
end
