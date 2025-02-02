class List < ApplicationRecord
  belongs_to :user
  has_many :list_books, dependent: :destroy
  has_many :books, through: :list_books
end
