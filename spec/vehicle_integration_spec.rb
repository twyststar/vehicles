require('capybara/rspec')
require('./app.rb')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('vehicle path', {:type => :feature}) do
  it('will accept new cars and display make on success') do
    visit('/')
    click_on('Add New Vehicle')
    fill_in('make', :with => 'Mazda')
    fill_in('model', :with => '2')
    fill_in('year', :with => '2013')
    click_on('Add Vehicle')
    expect(page).to have_content('Mazda')
  end
  it('') do
    visit('/')
    click_on('Add New Vehicle')
    fill_in('make', :with => 'Mazda')
    fill_in('model', :with => '2')
    fill_in('year', :with => '2013')
    click_on('Add Vehicle')
    click_on('See Vehicle List')
    expect(page).to have_content('Mazda')
  end
end
