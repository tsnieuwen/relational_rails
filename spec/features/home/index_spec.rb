require 'rails_helper'

RSpec.describe 'landing page' do
  it 'List title and link to both parent and athlete indices' do

    visit '/'

    expect(page).to have_content('Relational Rails Project')
    expect(page).to have_link('Resorts Index', :href => '/resorts')
    expect(page).to have_link('Teams Index', :href => '/teams')
    expect(page).to have_link('Athletes Index', :href => '/athletes')
    expect(page).to have_link('Customers Index', :href => '/customers')
  end
end
