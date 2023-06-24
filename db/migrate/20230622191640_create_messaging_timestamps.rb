class CreateMessagingTimestamps < ActiveRecord::Migration[7.0]
  def change
    create_table :messaging_timestamps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true
      t.string :action

      t.timestamps
    end
  end
end
