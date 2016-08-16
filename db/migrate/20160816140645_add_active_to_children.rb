class AddActiveToChildren < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :active, :boolean, default: true
  end
end
