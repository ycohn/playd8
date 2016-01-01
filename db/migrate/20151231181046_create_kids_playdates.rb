class CreateKidsPlaydates < ActiveRecord::Migration
  def change
    create_table :kids_playdates do |t|
      t.integer :kid_id
      t.integer :playdate_id
    end
  end
end
