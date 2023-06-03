class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :ability, :integer
    add_column :users, :commitment, :integer
    add_column :users, :about, :string
    add_column :users, :sampleurl, :string
    add_column :users, :photourl, :string
  end
end
