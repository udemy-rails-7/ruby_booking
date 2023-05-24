class Room < ApplicationRecord
    # Validations name and capacity are required
    validates :name, :capacity, presence: true
    has_many :bookings, dependent: :destroy
end
