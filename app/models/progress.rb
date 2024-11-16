class Progress < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :club
end
