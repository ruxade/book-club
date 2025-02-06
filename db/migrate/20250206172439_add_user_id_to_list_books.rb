class AddUserIdToListBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :list_books, :user_id, :integer
  end
end
