require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/teams/:id/athletes'" do
    it "Renders each athlete that is associated with that team with each athlete's attributes" do
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
      athlete2 = Athlete.create(name: "Rajon Rondo",
                                age: 26,
                                injury_list: true,
                                team_id: 1)
      athlete3 = Athlete.create(name: "Kobe Bryant",
                                age: 43,
                                injury_list: true,
                                team_id: 2)
      athlete4 = Athlete.create(name: "Shaq",
                                age: 45,
                                injury_list: true,
                                team_id: 2)

      visit "/teams/1/athletes"

      expect(page).to have_content(athlete1.name)
      expect(page).to have_content(athlete2.name)
      expect(page).to have_content("Age: #{athlete1.age}")
      expect(page).to have_content("Age: #{athlete2.age}")
      expect(page).to have_content("Currently Injured?: #{athlete1.injury_list}")
      expect(page).to have_content("Currently Injured?: #{athlete2.injury_list}")

      visit "/teams/2/athletes"

      expect(page).to have_content(athlete3.name)
      expect(page).to have_content(athlete4.name)
      expect(page).to have_content("Age: #{athlete3.age}")
      expect(page).to have_content("Age: #{athlete4.age}")
      expect(page).to have_content("Currently Injured?: #{athlete3.injury_list}")
      expect(page).to have_content("Currently Injured?: #{athlete4.injury_list}")
    end
  end
end
