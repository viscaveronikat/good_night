class Follow < ApplicationRecord
  validates :user_id, uniqueness: { scope: :followed_user_id }
  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
  scope :following_user, ->(id) { where(followed_user_id: id) }
end
