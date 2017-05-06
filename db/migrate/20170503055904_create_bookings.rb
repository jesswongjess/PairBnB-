class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, intex: true, foreign_key: true
      t.belongs_to :listing, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :number_guests

      t.timestamps
    end
  end
end
