require 'rails_helper'

feature "Viewing restaurants" do
  scenario "Can vist the home page" do
    visit '/restaurants'
    expect(page).to have_content("Rats and Roaches")
  end

end
