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

end
