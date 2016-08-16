class AddPhotoToChildren < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :photo, :string
  end
end
