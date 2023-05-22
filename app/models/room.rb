class Room < ApplicationRecord
    # Validations name and capacity are required
    validates :name, :capacity, presence: true

end
