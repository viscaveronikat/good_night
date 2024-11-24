class User < ApplicationRecord
  has_many :clock_ins
  has_many :follows
  has_many :followed_users, through: :follows
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_user_id'

  validates :name, presence: true
end
