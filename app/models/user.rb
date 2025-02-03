class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_clubs
  has_many :clubs, through: :user_clubs
  has_many :list_book
  has_many :lists, through: :list_book
end
