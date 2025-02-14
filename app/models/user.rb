class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_clubs, dependent: :destroy
  has_many :clubs, through: :user_clubs

  has_many :list_books, dependent: :destroy
  has_many :lists,  dependent: :destroy
  has_many :reviews, dependent: :destroy
end
