require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit any page on the site, there is a link to take me back to the Teams Index'" do
    it "It takes you back to teams index" do
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

      visit "/athletes"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/athletes/#{athlete1.id}"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/athletes/#{athlete1.id}/edit"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/teams/#{team1.id}"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/teams/#{team1.id}/athletes"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/teams/#{team1.id}/athletes/new"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/teams/#{team1.id}/edit"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/athletes/#{athlete1.id}"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')

      visit "/teams/new"
      expect(page).to have_link('Team Index')
      click_link('Team Index')
      expect(page).to have_current_path('/teams')
    end
  end
end
