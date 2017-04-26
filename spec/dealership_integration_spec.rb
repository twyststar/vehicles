require('capybara/rspec')
require('./app.rb')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('dealership path', {:type => :feature}) do
  it('will display added dealerships') do
    visit('/')
    click_on('Add New Dealership')
    fill_in('name', :with=>'Star\'s Sweet Rides')
    click_on('Add Dealership')
    click_on('See Dealership List')
    expect(page).to have_content('Star\'s Sweet Rides')
  end

    it('will display added dealerships') do
      visit('/')
      click_on('Add New Dealership')
      fill_in('name', :with=>'Ben\'s Sweet Rides')
      click_on('Add Dealership')
      click_on('See Dealership List')
      click_on('Ben\'s Sweet Rides')
      click_on('Add a new vehicle')
      fill_in('make', :with=>'Tesla')
      fill_in('model', :with=>'BnkACt')
      fill_in('year', :with=>'2017')
      click_on('Add Vehicle')
      expect(page).to have_content('Tesla')
    end
end
