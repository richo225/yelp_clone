class Review < ApplicationRecord

  validates :rating, inclusion: (1..5)
  belongs_to :restaurant
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }

  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user
    review
  end

end
