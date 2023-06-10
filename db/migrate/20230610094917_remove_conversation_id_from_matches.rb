class RemoveConversationIdFromMatches < ActiveRecord::Migration[7.0]
  def up
    remove_column :matches, :conversation_id, :bigint
  end

  def down
    add_column :matches, :conversation_id, :bigint
  end
end
