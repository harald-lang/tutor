class AddStartWeek < ActiveRecord::Migration[5.0]
  def change
  	add_column :courses, :startweek, :datetime
  end
end
