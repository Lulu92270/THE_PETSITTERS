class AddAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :role, :string, default: "petsitter"
  end
end
