class RemoveColumnFromPlaydates < ActiveRecord::Migration
  def change
    remove_column(:playdates, :kid_id)
  end
end
