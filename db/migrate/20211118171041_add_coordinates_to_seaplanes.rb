class AddCoordinatesToSeaplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :seaplanes, :latitude, :float
    add_column :seaplanes, :longitude, :float
  end
end
