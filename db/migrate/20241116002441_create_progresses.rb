class CreateProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :progresses do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true
      t.datetime :progress_date
      t.string :status

      t.timestamps
    end
  end
end
