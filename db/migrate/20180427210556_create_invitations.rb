class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :event_from
      t.integer :guest_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
