class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], allow_nil: false }, presence: true
  def avg_rating
    return nil if reviews.length == 0
    count = 0.0
    reviews.each do |r|
      count += r.rating
    end
    (count / reviews.length).round(2)
  end
end
