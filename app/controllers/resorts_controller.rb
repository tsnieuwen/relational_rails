class ResortsController < ApplicationController
  def index
    @resorts = Resort.all.order(:created_at)
  end

  def new

  end

  def create
    resort = Resort.new({
      name: params[:resort][:name],
      city: params[:resort][:city],
      cost: params[:resort][:cost],
      at_capacity: params[:resort][:at_capacity]
      })

    resort.save

    redirect_to '/resorts'
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def edit
    @resort = Resort.find(params[:id])
  end

  def update
    resort = Resort.find(params[:id])
    resort.update({
      name: params[:resort][:name],
      city: params[:resort][:city],
      cost: params[:resort][:cost],
      at_capacity: params[:resort][:at_capacity]
      })

    resort.save
    redirect_to "/resorts/#{resort.id}"
  end

  def destroy
    if !params[:resort_id].nil?
      Resort.destroy(params[:resort_id])
    else
      Resort.destroy(params[:id])
    end
    redirect_to '/resorts'
  end
end
