class AddNewColumnToMyTable < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
    add_column :events, :npc, :npc
    add_column :events, :location, :location
  end
end
