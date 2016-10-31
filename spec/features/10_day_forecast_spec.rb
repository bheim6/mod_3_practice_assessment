require 'rails_helper'

RSpec.feature "User sees 10 day forecast for each city" do
  scenario "they naviagte to a city and see the forecast" do
    destination = create(:destination,
            name: "Denver",
            description: "Great City",
            zip: "80218")

    # As a user
    # When I visit "/"
    visit '/'
    # And I click on a destination
    within(".links") do
      click_link "Show"
    end
    # Then I should be on page "/destinations/:id"
    expect(current_path).to eq("/destinations/#{destination.id}")
    # Then I should see the destination's name, zipcode, description, and 10 day weather forecast
    expect(page).to have_content("#{destination.name}")
    expect(page).to have_content("#{destination.zip}")
    expect(page).to have_content("#{destination.description}")
    # The weather forecast is specific to the destination whose page I'm on
    expect(page).to have_content("Forecast for #{destination.name}")

    # The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
    within(".forecast-10-day") do
      within("li:first-child") do
        expect(page).to have_content("Date:")
        expect(page).to have_content("High:")
        expect(page).to have_content("Low:")
        expect(page).to have_content("Conditions:")
      end
    end
  end
end
