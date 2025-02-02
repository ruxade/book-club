class CreateListBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :list_books do |t|
      t.references :list, null: false, foreign_key: true
      t.string :book_id
      t.string :title
      t.string :author
      t.string :cover_url

      t.timestamps
    end
  end
end
