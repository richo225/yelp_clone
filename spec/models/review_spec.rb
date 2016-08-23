describe Review do
  it "is invalid if rating is more than 5" do
    review = Review.new(rating: 6)
    expect(review).to have(1).error_on(:rating)
  end
end
