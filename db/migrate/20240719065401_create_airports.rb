class CreateAirports < ActiveRecord::Migration[7.1]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
