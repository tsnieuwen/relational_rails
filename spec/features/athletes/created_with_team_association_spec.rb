require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/teams/:id/athletes'" do
    it "Renders a 'Find Athlete' button at the bottom of the page" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)
      visit "/teams/#{team1.id}/athletes"

      expect(page).to have_button('Create Athlete')
    end
  end

  describe "When that button is clicked" do
    it "Redirects me to 'teams/:id/athletes/new' where there is a form to create a new athlete, and a 'Create Athlete' button at the bottom of the page" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)
      visit "/teams/#{team1.id}/athletes"
      click_button('Create Athlete')

      expect(page).to have_current_path("/teams/1/athletes/new")
      expect(page).to have_content('Input new athlete information')
      expect(page).to have_content('Name:')
      expect(page).to have_content('Age:')
      expect(page).to have_content('Currently injured?')
      expect(page).to have_button('Create Athlete')
    end
  end

  describe "When that information is filled out and the 'Create Athlete' button is clicked" do
    it "Redirects me to '/teams/:id/athletes' where the the new athlete is now rendered" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)

      visit "/teams/#{team1.id}/athletes"
      click_button('Create Athlete')
      fill_in('athlete[name]', with: 'Ray Allen')
      fill_in('athlete[age]', with: 43)
      fill_in('athlete[injury_list]', with: true)
      click_button('Create Athlete')

      expect(page).to have_current_path("/teams/1/athletes")
      expect(page).to have_content('Ray Allen')
      expect(page).to have_content('Age: 43')
      expect(page).to have_content('Currently Injured?: true')
    end
  end
end
