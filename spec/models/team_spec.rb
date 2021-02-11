require 'rails_helper'

describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :athletes }
  end

  describe 'instance methods' do
    describe '#filter_athletes' do
      it 'returns athletes that are older than provided user input' do
        team1 = Team.create!(city: "Boston", name: "Celtics", playoff_picture: true, championships: 19, id: 1)
        athlete1 = Athlete.create!(name: "Paul Pierce", age: 42, injury_list: true, team_id: 1)
        athlete2 = Athlete.create!(name: "Kevin Garnett", age: 48, injury_list: true, team_id: 1)

        expect((team1.filter_athletes(45)).first).to eq(athlete2)
      end
    end
  end
end
