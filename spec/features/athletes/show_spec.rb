require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/athletes/:id'" do
    it "Renders the athlete with the corresponding id, along with the athlete's attributes" do
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
                                id: 1,
                                team_id: 1)
      athlete2 = Athlete.create(name: "Kobe Bryant",
                                age: 43,
                                injury_list: true,
                                id: 2,
                                team_id: 2)

      visit "/athletes/1"

      expect(page).to have_content(athlete1.name)
      expect(page).to have_content("Age: #{athlete1.age}")
      expect(page).to have_content("Currently injured?: #{athlete1.injury_list}")

      visit "/athletes/2"

      expect(page).to have_content(athlete2.name)
      expect(page).to have_content("Age: #{athlete2.age}")
      expect(page).to have_content("Currently injured?: #{athlete2.injury_list}")
    end
  end
end
