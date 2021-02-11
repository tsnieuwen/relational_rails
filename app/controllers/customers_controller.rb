class CustomersController < ApplicationController
  def index
    @customers = Customer.return_customers_who_rented
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def show_by_resort
    @resort = Resort.find_by(id: params[:id].to_i)
    if !params[:min_age].nil?
      @customers = @resort.customers.return_customers_age_over_threshold(params[:min_age])
    else
      @customers = @resort.customers
    end

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update({
      name: params[:customer][:name],
      age: params[:customer][:age],
      equipment: params[:customer][:equipment]
      })

    customer.save
    redirect_to "/customers/#{customer.id}"
  end

  def new
    @resort_id = params[:id]
  end

  def create
    @resort = Resort.find(params[:resort_id])
    customer = @resort.customers.create!({
                             name: params[:customer][:name],
                             age: params[:customer][:age],
                             equipment: params[:customer][:equipment]
                            })
    customer.save
    redirect_to "/resorts/#{params[:resort_id]}/customers"
  end

  def destroy
    Customer.destroy(params[:id])
    redirect_to '/customers'
  end
end
