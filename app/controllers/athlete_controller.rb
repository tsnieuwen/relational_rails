class AthleteController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.find(params[:id])
    athlete = Athlete.new({
      name: params[:athlete][:name],
      age: params[:athlete][:age],
      injury_list: params[:athlete][:injury_list]
      })

    athlete.save

    redirect_to "/teams/#{@team.id}/athletes"
    end

end
