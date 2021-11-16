class ChangeBoatsToSeaplanes < ActiveRecord::Migration[6.0]
  def change
    rename_table :boats, :seaplanes
  end
end
