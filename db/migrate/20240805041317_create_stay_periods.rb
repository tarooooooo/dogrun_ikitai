class CreateStayPeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :stay_periods do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :dog_run, null: false, foreign_key: true
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.boolean :is_currently_staying, null: false, default: true

      t.timestamps
    end
  end
end
