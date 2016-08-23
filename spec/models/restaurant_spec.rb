require 'rails_helper'

describe Restaurant do

  it "is not valid with a name shorter than 3 characters" do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid without a unique name" do
    Restaurant.create(name: "hello")
    restaurant = Restaurant.new(name:"hello")
    expect(restaurant).to have(1).error_on(:name)
  end

end
