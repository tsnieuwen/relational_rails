require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit '/athletes/:id'" do
    it "Has a link to update the athlete" do

      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 1)

      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 1)

      visit "/athletes/#{athlete1.id}"

      expect(page).to have_link("Update Athlete")
    end
  end

  describe "When I click on the 'Update Athlete' link" do
    it "Redirects me to '/athletes/athlete1.id/edit' " do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 28)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 28,
                                id: 45)

      visit "/athletes/#{athlete1.id}"
      click_link('Update Athlete')

      expect(page).to have_current_path('/athletes/45/edit')
    end
  end

  describe "Once redirected to this athlete edit page" do
    it "has a form where all athlete attributes can be updated, and a 'Update Athlete' button on the bottom of the page" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 28)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 28,
                                id: 45)


      visit "/athletes/#{athlete1.id}/edit"
      expect(page).to have_content('Update athlete information')
      expect(page).to have_content('Name:')
      expect(page).to have_content('Age:')
      expect(page).to have_content('Currently Injured?:')
      expect(page).to have_button('Update Athlete')
    end
  end

  describe "After filling out the forms, clicking 'Update Athlete', you are redirected back to the athlete show page, where" do
    it "Displays the athlete with the updated information" do
      team1 = Team.create(city: "Boston",
                          name: "Celtics",
                          playoff_picture: true,
                          championships: 19,
                          id: 28)
      athlete1 = Athlete.create(name: "Paul Pierce",
                                age: 42,
                                injury_list: true,
                                team_id: 28,
                                id: 45)

      visit "/athletes/#{athlete1.id}/edit"
      fill_in('athlete[name]', with: 'Larry Bird')
      fill_in('athlete[age]', with: 63)
      fill_in('athlete[injury_list]', with: true)
      click_button('Update Athlete')

      expect(page).to have_current_path('/athletes/45')
      expect(page).to have_content("Name: Larry Bird")
      expect(page).to have_content('Age: 63')
      expect(page).to have_content('Currently injured?: true')
    end
  end
end
