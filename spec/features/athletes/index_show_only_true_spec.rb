require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/athletes'" do
    it "Only renders athletes that have 'true' value for the 'injury_list' attribute" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 1)
      athlete2 = Athlete.create(name: "Kobe Bryant",
                                age: 43,
                                injury_list: false,
                                team_id: 1)
      visit "/athletes"

      expect(page).to have_content(athlete1.name)
      expect(page).to_not have_content(athlete2.name)
      expect(page).to have_content("Age: #{athlete1.age}")
      expect(page).to_not have_content("Age: #{athlete2.age}")
      expect(page).to have_content("Currently Injured?: #{athlete1.injury_list}")
      expect(page).to_not have_content("Currently Injured?: #{athlete2.injury_list}")
    end
  end
end
