require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/teams'" do
    it "Has a link to create a new team" do

      visit "/teams"

      expect(page).to have_link("New Team")
    end
  end

  describe "When I click on that link" do
    it "Redirects me to 'teams/new'" do
      visit '/teams'
      click_link('New Team')
      expect(page).to have_current_path('/teams/new')
    end

    it "Redirect me to 'team/new', which has a form for new team info" do
      visit '/teams'
      click_link('New Team')
      expect(page).to have_content('Input new team information')
      expect(page).to have_content('City:')
      expect(page).to have_content('Name:')
      expect(page).to have_content('Playoff Picture?:')
      expect(page).to have_content('Number of Championships:')
      expect(page).to have_button('Create Team')
    end
  end

  describe "When I fill out the form with a new parent's attributes, then click 'Create Team'" do
    it "Will create the new team and display it on the '/teams' page" do
      visit '/teams/new'
      fill_in('team[city]', with: 'Boston')
      fill_in('team[name]', with: 'Celtics')
      fill_in('team[playoff_picture]', with: true)
      fill_in('team[championships]', with: 17)
      click_button('Create Team')
      expect(page).to have_current_path('/teams')
      expect(page).to have_content('Celtics')
    end
  end
end
