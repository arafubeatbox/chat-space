class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :message, null: false
      t.string :image
      t.references :user, foreign_key: true, null: false
      t.references :chat, foreign_key: true, null: false
      t.timestamps
    end
  end
end
