class ClockIn < ApplicationRecord
  belongs_to :user

  validates :clock_in_time, presence: true
  validates :wake_up_time, presence: true
end
