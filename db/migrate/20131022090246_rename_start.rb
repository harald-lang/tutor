class RenameStart < ActiveRecord::Migration[5.0]
  def change
  	rename_column :groups,:start,:starttime
  end
end
