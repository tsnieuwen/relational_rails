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
    it "Redirects you to the '/teams', where that deleted team is no longer shown and all athletes associated with that team are also deleted" do
      team1 = Team.create(city: "LA",
                          name: "Lakers",
                          playoff_picture: true,
                          championships: 18,
                          id: 2)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 2)
      athlete2 = Athlete.create(name: "Kobe Bryant",
                                age: 43,
                                injury_list: true,
                                team_id: 2)

      visit "/teams/#{team1.id}"
      click_button('delete')

      expect(page).to have_current_path("/teams")
      expect(page).to_not have_content('Celtics')

      visit "/athletes/"
      expect(page).to_not have_content('Paul Pierce')
      expect(page).to_not have_content('Kobe Bryant')
    end
  end
end
