require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/team/:id'" do
    it "Displays the total number of athletes associated with the team at the bottom of the page" do
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
                                injury_list: true,
                                team_id: 1)
      visit "/teams/#{team1.id}"

      expect(page).to have_content('Total number of athletes: 2')
    end
  end
end
