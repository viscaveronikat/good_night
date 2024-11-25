class Api::V1::ClockInRecordsController < ApplicationController
  # POST /clock_in_records
  def create
    begin
      ActiveRecord::Base.transaction do
        clock_in_record = ClockIn.new(clock_in_record_params)
        if clock_in_record.save
          render json: clock_in_record, status: :created
        else
          render json: { errors: clock_in_record.errors.full_messages }, status: :unprocessable_entity
        end
      end
    rescue StandardError => e
      Rails.logger.error("Request failed: #{e.message}")
    end
  end

  # GET /clock_in_records
  def index
    clock_in_records = ClockIn.order(created_at: :desc)
    render json: clock_in_records
  end

  private

  def clock_in_record_params
    params.require(:clock_in_record).permit(:user_id, :clock_in_time, :wake_up_time)
  end
end
