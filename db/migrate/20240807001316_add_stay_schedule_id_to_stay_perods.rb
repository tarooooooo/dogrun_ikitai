class AddStayScheduleIdToStayPerods < ActiveRecord::Migration[6.1]
  def change
    add_column :stay_periods, :stay_schedule_id, :integer, after: :dog_run_id
  end
end
