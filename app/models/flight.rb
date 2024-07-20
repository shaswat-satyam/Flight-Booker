class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: 'Airport',primary_key:"id"
    belongs_to :arrival_airport , class_name: 'Airport',primary_key:"id"
    has_many :bookings, primary_key:"id"
end
