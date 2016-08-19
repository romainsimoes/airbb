class Review < ApplicationRecord
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }
  validates :comment, presence: true
  belongs_to :user
  belongs_to :child
end
