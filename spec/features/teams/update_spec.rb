require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/teams/:id'" do
    it "Has a link to update the team" do

      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19)

      visit "/teams/#{team1.id}"

      expect(page).to have_link("Update Team")
    end
  end

  describe "When I click on the 'Update Team' link" do
    it "Redirects me to '/teams/team1.id/edit' " do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 28)

      visit "/teams/#{team1.id}"
      click_link('Update Team')

      expect(page).to have_current_path('/teams/28/edit')
    end
  end

  describe "Once redirected to this team edit page" do
    it "has a form where all team attributes can be updated, and a 'Update Team' button on the bottom of the page" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 28)

      visit "/teams/#{team1.id}/edit"
      expect(page).to have_content('Update team information')
      expect(page).to have_content('City:')
      expect(page).to have_content('Name:')
      expect(page).to have_content('Playoff Picture?:')
      expect(page).to have_content('Number of Championships')
      expect(page).to have_button('Update Team')
    end
  end

  describe "After filling out the forms, clicking 'Update Team', you are redirected back to the team show page, where" do
    it "Displays the team with the updated information" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 28)

      visit "/teams/#{team1.id}/edit"
      fill_in('team[city]', with: 'Boston')
      fill_in('team[name]', with: 'Celtics')
      fill_in('team[playoff_picture]', with: false)
      fill_in('team[championships]', with: 17)
      click_button('Update Team')

      expect(page).to have_current_path('/teams/28')
      expect(page).to have_content('Celtics')
      expect(page).to have_content('City: Boston')
      expect(page).to have_content('Playoff hunt?: false')
      expect(page).to have_content('Number of championships: 17')
    end
  end
end
