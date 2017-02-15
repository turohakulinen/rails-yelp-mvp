class Review < ApplicationRecord
  belongs_to :restaurant
  validates_associated :restaurant
  validates :content, presence: true
  validates_numericality_of :rating
  validates :rating, inclusion: { in: [0,1,2,3,4,5], allow_nil: false }
end
