require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit /teams/:id'" do
    it "Renders a link 'View Athletes' that takes me to the team's athletes show page" do
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
      expect(page).to have_link('View Athletes')

      click_link('View Athletes')
      expect(page).to have_current_path("/teams/#{team1.id}/athletes")
    end
  end
end
