class Passenger < ApplicationRecord
    validates :name, presence: true
    has_many :bookings, foreign_key:"id"
end
