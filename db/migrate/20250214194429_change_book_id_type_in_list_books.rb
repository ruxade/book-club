class ChangeBookIdTypeInListBooks < ActiveRecord::Migration[7.1]
  def up
    # Change the column type for book_id to bigint using a conversion
    change_column :list_books, :book_id, :bigint, using: 'book_id::bigint'
  end

  def down
    change_column :list_books, :book_id, :string
  end
end
