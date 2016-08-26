require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'Users can only leave one review per restaurant' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'Great'
    select '2', from: 'Rating'
    click_button 'Leave Review'
    expect(page).not_to have_content('Great')
  end

  scenario 'Users can delete their own reviews' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'

    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'

    click_link 'Delete KFC review'
    expect(page).not_to have_content('so so')
  end
end
