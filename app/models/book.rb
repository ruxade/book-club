class Book < ApplicationRecord
  has_many :list_books
  has_many :lists, through: :list_books
  has_many :reviews, dependent: :destroy
end
