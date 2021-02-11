require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/athletes'" do
    it "Renders each athlete in the system and their attributes" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)
      team2 = Team.create(city: "LA",
                          name: "Lakers",
                          playoff_picture: true,
                          championships: 18,
                          id: 2)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 1)
      athlete2 = Athlete.create(name: "Kobe Bryant",
                                age: 43,
                                injury_list: true,
                                team_id: 2)
      visit "/athletes"

      expect(page).to have_content(athlete1.name)
      expect(page).to have_content(athlete2.name)
      expect(page).to have_content("Age: #{athlete1.age}")
      expect(page).to have_content("Age: #{athlete2.age}")
      expect(page).to have_content("Currently Injured?: #{athlete1.injury_list}")
      expect(page).to have_content("Currently Injured?: #{athlete2.injury_list}")
    end
  end
end
