require 'rails_helper'

describe Restaurant do

  it "is not valid with a name shorter than 3 characters" do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

end
