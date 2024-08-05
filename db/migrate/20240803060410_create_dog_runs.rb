class CreateDogRuns < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_runs do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
