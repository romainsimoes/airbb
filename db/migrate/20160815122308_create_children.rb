class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :name
      t.string :address
      t.integer :age
      t.string :sex
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
