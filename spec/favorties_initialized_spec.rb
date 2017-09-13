require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_excepeptions, false)

describe('list path', {:type => :feature}) do
  it "will display user input into list" do
    visit('/')
    fill_in('name', :with => 'tacos')
    click_button('Go!')
    expect(page).to have_content('tacos')
  end
  it "display name of clicked item" do
    visit('/')
    click_link('tacos')
    save_and_open_page
    expect(page).to have_content('tacos')
  end
end
