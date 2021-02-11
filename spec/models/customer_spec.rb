require 'rails_helper'

describe Customer do
  before :each do
    Customer.destroy_all
    Resort.destroy_all
    @breck = Resort.create!(name: 'Breck Ski Resort', city: 'Breckenridge', cost: 500, at_capacity: false)
    @aspin = Resort.create!(name: 'Aspin Ski Resort', city: 'Aspin',cost: 900, at_capacity: false)
    @love = Resort.create!(name: 'Loveland Ski Resort', city: 'Loveland', cost: 250, at_capacity: true)

    @breck.customers.create!(name: 'Tommy', equipment: true, age: 29)
    @breck.customers.create!(name: 'Harrison', equipment: true, age: 21)

    @allison = @aspin.customers.create!(name: 'Allison', equipment: false, age: 56)
    @aspin.customers.create!(name: 'Ryan', equipment: true, age: 50)

    @love.customers.create!(name: 'Mark', equipment: true, age: 37)
    @love.customers.create!(name: 'Cindy', equipment: false, age: 18)
  end

  describe Customer, type: :model do
    describe 'relationships' do
      it { should belong_to :resort }
    end
  end

  describe "class methods" do
    describe '::reuturn_customers_who_rented' do
      it "returns all customers whose equipment value was true" do
        expect(Customer.return_customers_who_rented.length).to eq(4)
      end
    end
    describe '::return_customers_age_over_threshold' do
      it "returns all customers over a given value" do
        expect(Customer.return_customers_age_over_threshold(49).length).to eq(2)
      end
    end
    describe '::return_customers_sorted_alpha' do
      it "returns customers sorted in alphabetical order" do
        expect(Customer.return_customers_sorted_alpha.first).to eq(@allison)
      end
    end
  end
end
