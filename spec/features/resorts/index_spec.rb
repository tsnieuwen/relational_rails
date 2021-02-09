require 'rails_helper'

RSpec.describe 'Resorts index page' do
  it 'Shows each Resort name in the table' do
    resort_1 = Resort.create(name: "Resort 1", city: "city 1", cost: 200, at_capactity: false)
    resort_2 = Resort.create(name: "Resort 2", city: "city 2", cost: 300, at_capactity: false)

    visit '/resorts'

    expect(page).to have_content('All Resorts')
    expect(page).to have_content(resort_1.name)
    expect(page).to have_content(resort_2.name)

    expect(page).to have_link('add a new resort', :href => '/resorts/new')
    expect(page).to have_link('back to homepage', :href => '/')
  end
end
