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

  context "viewing restaurants" do

    let!(:kfc) { Restaurant.create(name: "KFC") }

    scenario "can visit KFC restaurant" do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{ kfc.id }"
    end

  end

  context "editing restaurants" do

    before do
      Restaurant.create(name: "KFC", description: "Best chicken popcorn")
    end

    scenario "user can edit a restaurant" do
      visit "/restaurants"
      click_link "Edit KFC"
      fill_in "Name", with: "Kentucky Fried Chicken"
      fill_in "Description", with: "Not as good as last year"
      click_button "Update Restaurant"
      expect(page).to have_content "Kentucky Fried Chicken"
      expect(page).to have_content "Not as good as last year"
      expect(current_path).to eq "/restaurants"
    end
    
  end

end
