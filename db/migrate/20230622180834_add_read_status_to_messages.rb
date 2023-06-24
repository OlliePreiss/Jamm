class AddReadStatusToMessages < ActiveRecord::Migration[7.0]
  def change
      add_column :messages, :read_status, :boolean
  end
end
