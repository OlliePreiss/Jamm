class ChangeMessageToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :message, :content
  end
end
