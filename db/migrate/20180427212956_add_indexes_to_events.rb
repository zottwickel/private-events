class AddIndexesToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_index :events, [:date, :creator_id], unique: true
  end
end
