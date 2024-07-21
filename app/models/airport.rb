class Airport < ApplicationRecord
  validates :code, presence: true,uniqueness: true
  validates :name, presence: true
  validates :address, presence: true
    has_many :departing_flights, class_name: 'Flight', foreign_key:"departure_airport_id"
    has_many :arriving_flights, class_name: 'Flight', foreign_key:"arrival_airport_id"
end
