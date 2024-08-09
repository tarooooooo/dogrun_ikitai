class AddOpeningTimeAndClosingTimeToDogRuns < ActiveRecord::Migration[6.1]
  def change
    add_column :dog_runs, :opening_time, :time, null: false
    add_column :dog_runs, :closing_time, :time, null: false
  end
end
