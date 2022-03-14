class Review < ApplicationRecord
  validates :score, :comment, :user_id, presence: true
end
