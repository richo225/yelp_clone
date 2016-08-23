require "rails_helper"

feature "User can sign in and out" do

  context "user is not signed in and is on the homepage" do
    scenario "user can see a sign up and sign in link" do
      visit "/"
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Sign in")
    end

    scenario "user cannot see a sign out link" do
      visit "/"
      expect(page).not_to have_link("Sign out")
    end
  end

  context "user is already signed up and is on the homepage" do

    before do
      visit "/"
      click_link "Sign up"
      fill_in "Email", with: "bob@gmail.com"
      fill_in "Password", with: "123123"
      fill_in "Password confirmation", with: "123123"
      click_button "Sign up"
    end

    scenario "user can see a sign out link" do
      visit "/"
      expect(page).to have_link ("Sign out")
    end

    scenario "user cannot see a sign up and sign in link" do
      visit "/"
      expect(page).to_not have_link("Sign up")
      expect(page).to_not have_link("Sign in")
    end
  end



end
