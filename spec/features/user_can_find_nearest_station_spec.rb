require 'rails_helper'

describe "user can find the nearest electric charging station" do
  scenario "can select 'Turing' from start location" do
    it "and find the closest location after clicking 'Find Nearest Station'"
    visit '/'

    select "Turing"

    click_on "Find Nearest Station"

    expect(current_path).to eq('/search')

    expect(page).to have_css(".name")
    expect(page).to have_css(".address")
    expect(page).to have_css(".fuel_type")
    expect(page).to have_css(".access_times")

    expect(page).to have_content("Distance of nearest station")
    expect(page).to have_content("Travel time from location")
    expect(page).to have_content("Directions")

  end
end
