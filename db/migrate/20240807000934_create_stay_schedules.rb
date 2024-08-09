class CreateStaySchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :stay_schedules do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :dog_run, null: false, foreign_key: true
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.timestamps
    end
  end
end
