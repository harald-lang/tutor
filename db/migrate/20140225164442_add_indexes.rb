class AddIndexes < ActiveRecord::Migration[5.0]
  def change
  	add_index :chat_messages, :room
  end
end
