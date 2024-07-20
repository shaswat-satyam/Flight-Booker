class Booking < ApplicationRecord
    has_one :flight, foreign_key:"id"
    has_many :passenger
end

