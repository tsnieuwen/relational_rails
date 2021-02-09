class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def show_by_resort
    @resort = Resort.find_by(id: params[:id].to_i)
    @customers = @resort.customers
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
  end

  def create
    resort = Resort.find(params[:id])
    resort.customers.create!(
                             name: params[:customer][:name],
                             age: params[:customer][:age],
                             equipment: params[:customer][:equipment]
                            )

    redirect_to '/resorts/:id/customers'
  end

  def destroy
    Customer.destroy(params[:id])
    redirect_to '/customers'
  end
end
