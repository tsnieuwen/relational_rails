require 'rails_helper'

RSpec.describe 'landing page' do
  it 'List title and link to both parent indices' do

    visit '/'

    expect(page).to have_content('Relational Rails Project')
    expect(page).to have_link('Resorts Index', :href => '/resorts')
    expect(page).to have_link('Teams Index', :href => '/teams')
  end
end
