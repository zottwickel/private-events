class Invitation < ApplicationRecord

	belongs_to :event
	belongs_to :guest, :class_name => "User"

	validates_uniqueness_of :guest_id, scope: :event_from

end