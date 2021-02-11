require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit the /teams/:id/athletes page" do
    it "I see a form that takes an integer value" do
      team1 = Team.create(city: "Boston",
                       name: "Celtics",
                       playoff_picture: true,
                       championships: 19)


   visit "/teams/#{team1.id}/athletes"

   expect(page).to have_button("Filter Athletes")
 end

end
  describe "When I click 'find athletes'" do
    it "Redirects me to '/teams/team1.id/athletes' with only athletes that meet threshold" do
      team1 = Team.create(city: "Boston",
                       name: "Celtics",
                       playoff_picture: true,
                       championships: 19,
                       id: 1)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 56,
                                injury_list: true,
                                team_id: 1)
      athlete2 = Athlete.create(name: "Rajon Rondo",
                                age: 18,
                                injury_list: true,
                                team_id: 1)
      athlete3 = Athlete.create(name: "Kevin Garnett",
                                age: 40,
                                injury_list: true,
                                team_id: 1)

         visit "/teams/#{team1.id}/athletes"
         fill_in 'filter_min_age', :with => 38
         click_button("Filter Athletes")
         expect(page).to have_content(athlete1.name)
         expect(page).to have_content(athlete3.name)
         expect(page).not_to have_content(athlete2.name)
    end
end
end
