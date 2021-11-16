class AddUserToSeaplanes < ActiveRecord::Migration[6.0]
  def change
    add_reference :seaplanes, :user, foreign_key: true
  end
end
