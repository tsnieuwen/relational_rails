require 'rails_helper'

RSpec.describe "teams index page" do
 it "Renders records in order " do
   team1 = Team.create(city: "Boston",
                       name: "Celtics",
                       playoff_picture: true,
                       championships: 19,
                        )
   team2 = Team.create(city: "LA",
                       name: "Lakers",
                       playoff_picture: true,
                       championships: 15,
                      )
   visit "/teams"

   expect(team2.name).to appear_before(team1.name)
 end
end
