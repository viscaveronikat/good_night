class Api::V1::SleepRecordsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    sleep_records = user.followed_users.flat_map do |followed_user|
      followed_user.clock_ins.where(clock_in_time: 7.days.ago.beginning_of_day..Time.now)
    end

    sorted_sleep_records = sleep_records.sort_by { |record| record.wake_up_time - record.clock_in_time }.reverse
    render json: sorted_sleep_records
  end
end
