class AddMatchReferenceToConversations < ActiveRecord::Migration[7.0]
  def change
    add_reference :conversations, :match, index: true
  end
end
