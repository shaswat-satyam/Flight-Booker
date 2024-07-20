class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :model
      t.integer :capacity
      t.integer :arrival_airport_id
      t.integer :departure_airport_id
      t.date :departure_time
      t.date :arrival_time

      t.timestamps
    end
  end
end
