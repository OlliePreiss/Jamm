class ChangeLastMessageToHasUnreadMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :conversations, :lastmessage
    add_column :conversations, :has_unread_messages, :boolean, default: false
  end
end
