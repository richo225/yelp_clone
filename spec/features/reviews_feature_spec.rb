require "rails_helper"

feature "reviews" do

  let! (:kfc) { Restaurant.create(name: "KFC") }

  scenario "leaving a review" do
    visit "/restaurants"
    click_link "Review KFC"
    fill_in "Thoughts", with: "Rubbish"
    select "1", from: "Rating"
    click_button "Submit Review"
    expect(page).to have_content "Rubbish"
    expect(current_path).to eq "/restaurants/#{kfc.id}"
  end
end
