class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :total_price
      t.integer :person

      t.timestamps
    end
  end
end
