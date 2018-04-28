class AddIndexesToInvitations < ActiveRecord::Migration[5.1]
  def change
  	add_index :invitations, [:event_from, :guest_id]
  end
end
