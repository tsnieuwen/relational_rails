require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit any page on the site, there is a link to take me back to the Athletes Index'" do
    it "It takes you back to athletes index" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)
      athlete1 = Athlete.create(name: "Paul Pierce",
                          age: 42,
                          injury_list: true,
                          team_id: 1,
                          id: 1)

      visit "/teams"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/teams/new"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/teams/#{team1.id}"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/teams/#{team1.id}/edit"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/teams/#{team1.id}/athletes"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/athletes/#{athlete1.id}"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/athletes/#{athlete1.id}/edit"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')

      visit "/teams/#{team1.id}/athletes/new"
      expect(page).to have_link('Athlete Index')
      click_link('Athlete Index')
      expect(page).to have_current_path('/athletes')
    end
  end
end
