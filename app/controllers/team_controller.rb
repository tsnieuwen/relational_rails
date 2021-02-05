class TeamController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
  end

  def create
    team = Team.new({
      city: params[:team][:city],
      name: params[:team][:name],
      playoff_picture: params[:team][:playoff_picture],
      championships: params[:team][:championships]
      })
    team.save
    redirect_to '/teams'
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update({
      city: params[:team][:city],
      name: params[:team][:name],
      playoff_picture: params[:team][:playoff_picture],
      championships: params[:team][:championships]
      })
    team.save
    redirect_to "/teams/#{team.id}"
  end

  def destroy
    Team.destroy(params[:id])
    redirect_to '/teams'
  end

end
