class TeamController < ApplicationController

  def index
    @teams = Team.order(created_at: :desc)
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

  def show_athletes
    @team = Team.find(params[:id])
    if (params[:filter_min_age])
      @athletes = @team.filter_athletes(params[:filter_min_age])
    else
      @athletes = @team.athletes
    end
  end

end
