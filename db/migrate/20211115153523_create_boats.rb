class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.string :category
      t.integer :availability
      t.integer :capacity

      t.timestamps
    end
  end
end
