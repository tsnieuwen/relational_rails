class AthleteController < ApplicationController
  def index
    all_athletes = Athlete.all
    @athletes = all_athletes.order(:created_at)
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

    redirect_to "/teams/#{athlete.team_id}/athletes"
    end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    athlete = Athlete.find(params[:id])
    athlete.update({
      name: params[:athlete][:name],
      age: params[:athlete][:age],
      injury_list: params[:athlete][:injury_list]
      })
    athlete.save
    redirect_to "/athletes/#{athlete.id}"
  end

  def destroy
    Athlete.destroy(params[:id])
    redirect_to '/athletes'
  end

end
