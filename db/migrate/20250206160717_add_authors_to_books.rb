class AddAuthorsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :authors, :string
  end
end
