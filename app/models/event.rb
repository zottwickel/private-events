class Event < ApplicationRecord

	has_many   :invitations, :foreign_key => "event_from", :class_name => "Invitation"
	belongs_to :creator,     :class_name => "User"
	default_scope -> { order(created_at: :desc) }

##################### Validations #####################

	validates :name, 		 presence: true,
									 		 length: { maximum: 126 }

	validates :location, presence: true,
											 length: { maximum: 255 }

	validates :date, 		 presence: true
	validate :future_date

	private

	def future_date
		if self.date < Time.now
			errors.add(:date, "cannot be in the past!")
		end
	end

end
