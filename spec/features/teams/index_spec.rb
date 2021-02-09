 require 'rails_helper'

RSpec.describe "teams index page" do
  it "can see all the names of each parent record in the system" do
    team1 = Team.create(city: "Boston",
                        name: "Celtics",
                        playoff_picture: true,
                        championships: 19)
    team2 = Team.create(city: "LA",
                        name: "Lakers",
                        playoff_picture: true,
                        championships: 15)
    visit "/teams"

    expect(page).to have_content(team1.name)
    expect(page).to have_content(team2.name)
  end
end
