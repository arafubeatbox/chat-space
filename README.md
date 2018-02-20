## usersテーブル(deviseのカラムを除く)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :chats, through: :chat_users
- has_many :chat_users
- has_many :messages


## chatsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users, through: :chat_users
- has_many :chat_users
- has_many :messages


## chat_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|chat_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :chat


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|image|string||
|user_id|references|null: false, foreign_key:true|
|chat_id|references|null: false, foreign_key:true|

### Association
- belongs_to :user
- belongs_to :chat
