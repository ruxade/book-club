class Club < ApplicationRecord
  has_many :users, through: :user_club
  has_many :meetings, dependent: :destroy
  validates :name, presence: true, uniqueness: true

end
