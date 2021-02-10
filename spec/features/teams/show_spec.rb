 require 'rails_helper'

 RSpec.describe "teams show page" do
   it "can see all attributes and data of selected parent" do
     team1 = Team.create(city: "Boston",
                         name: "Celtics",
                         playoff_picture: true,
                         championships: 19,
                         id: 1)
     team2 = Team.create(city: "LA",
                         name: "Lakers",
                         playoff_picture: true,
                         championships: 15,
                        id: 2)
     visit '/teams/1'

     expect(page).to have_content(team1.name)
     expect(page).to have_content("City: #{team1.city}")
     expect(page).to have_content("Playoff hunt?: #{team1.playoff_picture}")
     expect(page).to have_content("Number of championships: #{team1.championships}")

     visit '/teams/2'

     expect(page).to have_content(team2.name)
     expect(page).to have_content("City: #{team2.city}")
     expect(page).to have_content("Playoff hunt?: #{team2.playoff_picture}")
     expect(page).to have_content("Number of championships: #{team2.championships}")

   end
 end
