class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :price
      t.time :start_time
      t.time :end_time
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
