class AthleteController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.find(params[:team_id])
    athlete = @team.athletes.create!({
      name: params[:athlete][:name],
      age: params[:athlete][:age],
      injury_list: params[:athlete][:injury_list]
      })

    athlete.save

    redirect_to "teams/#{athlete.team_id}/athletes"
    end

end
