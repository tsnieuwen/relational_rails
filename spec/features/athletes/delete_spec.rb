require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/athletes/:id'" do
    it "Has a button to delete the team" do

      team1 = Team.create(city: "LA",
                          name: "Lakers",
                          playoff_picture: true,
                          championships: 18,
                          id: 2)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 2,
                                id: 1)

      visit "/athletes/#{athlete1.id}"

      expect(page).to have_button("delete")
    end
  end

  describe "When the 'delete' button is clicked" do
    it "Redirects you to the '/athletes', where that deleted athlete is no longer shown." do
      team1 = Team.create(city: "LA",
                          name: "Lakers",
                          playoff_picture: true,
                          championships: 18,
                          id: 2)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 2,
                                id: 1)


      visit "/athletes/#{athlete1.id}"
      click_button('delete')

      expect(page).to have_current_path("/athletes")
      expect(page).to_not have_content(athlete1.name)
    end
  end
end
