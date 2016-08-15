class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :address
      t.string :credit_card
      t.string :description
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end
