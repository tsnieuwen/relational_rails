require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/teams/:id'" do
    it "Has a button to delete the team" do

      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19)

      visit "/teams/#{team1.id}"

      expect(page).to have_button("delete")
    end
  end

  describe "When the 'delete' button is clicked" do
    it "Redirects you to the '/teams', where that deleted team is no longer shown" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19)

      visit "/teams/#{team1.id}"
      click_button('delete')

      expect(page).to have_current_path("/teams")
      expect(page).to_not have_content('Celtics')
    end
  end
end
