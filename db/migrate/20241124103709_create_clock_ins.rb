class CreateClockIns < ActiveRecord::Migration[8.0]
  def change
    create_table :clock_ins do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :clock_in_time, null: false
      t.datetime :wake_up_time, null: false
      t.timestamps
    end
  end
end
