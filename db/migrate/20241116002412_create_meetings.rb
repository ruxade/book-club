class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true
      t.string :location
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
