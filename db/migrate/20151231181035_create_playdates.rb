class CreatePlaydates < ActiveRecord::Migration
  def change
    create_table :playdates do |t|
      t.string :location
      t.integer :kid_id
    end
  end
end