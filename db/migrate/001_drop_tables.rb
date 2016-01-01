class DropTables < ActiveRecord::Migration
  def change
    drop_table :kids
    drop_table :parents
    drop_table :playdates
    drop_table :kids_playdates
  end
end
