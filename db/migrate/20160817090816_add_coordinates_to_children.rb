class AddCoordinatesToChildren < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :latitude, :float
    add_column :children, :longitude, :float
  end
end
