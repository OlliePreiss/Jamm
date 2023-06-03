class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.boolean :senderstatus
      t.boolean :receiverstatus
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
