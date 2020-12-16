require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit an applications show page' do
   
  it 'I can approve a pet on an application'  do
    joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    kitteh = create(:pet, shelter: shelter)

    visit "/applications/#{joe.id}"
    fill_in "Add a Pet to this Application", with:"#{puppy.name.downcase}"
    click_on "Search"
    click_link "Adopt this Pet"
    visit "/admin/applications/#{joe.id}"
    
    expect(current_path).to eq "/admin/applications/#{joe.id}"
    click_button "Approve Application"
    expect(current_path).to eq "/admin/applications/#{joe.id}"
  end
end
end