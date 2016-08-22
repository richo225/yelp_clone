require 'rails_helper'

feature "restaurants" do
  scenario "prompts to add a restaurant" do
    visit "/restaurants"
    expect(page).to have_content "No restaurants yet"
    expect(page).to have_link "Add a restaurant"
  end

end
