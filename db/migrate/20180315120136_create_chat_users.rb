class CreateChatUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :chat, foreign_key: true, null: false
      t.timestamps
    end
  end
end
