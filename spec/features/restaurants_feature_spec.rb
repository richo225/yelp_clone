require 'rails_helper'

feature "restaurants" do

  context "no restaurants added" do
    scenario "prompts to add a restaurant" do
      visit "/restaurants"
      expect(page).to have_content ("No restaurants yet")
      expect(page).to have_link ("Add a restaurant")
    end
  end

  context "restaurants already added" do
    before do
      Restaurant.create(name: "KFC")
    end
    scenario "restaurants displayed" do
      visit "/restaurants"
      expect(page).to have_content "KFC"
      expect(page).not_to have_content "No restaurants yet"
    end
  end

  context "creating restaurants" do
    scenario "prompts user to fill in a form and displays the new restaurant" do
      visit "/restaurants"
      click_link "Add a restaurant"
      fill_in "Name", with: "KFC"
      click_button "Create Restaurant"
      expect(page).to have_content "KFC"
      expect(current_path).to eq "/restaurants"
    end
  end

end
