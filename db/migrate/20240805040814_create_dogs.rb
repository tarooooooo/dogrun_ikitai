class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birth_day, null: false
      t.integer :gender, null: false

      t.timestamps
    end
  end
end
