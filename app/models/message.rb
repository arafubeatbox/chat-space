class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :message, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
