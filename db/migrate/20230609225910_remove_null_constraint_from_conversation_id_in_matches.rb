class RemoveNullConstraintFromConversationIdInMatches < ActiveRecord::Migration[7.0]
  def change
    change_column_null :matches, :conversation_id, true
  end
end
