require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit an applications show page' do
   
  it 'I can approve a pet on an application'  do
    joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    pet_app = PetApplication.create!(application: joe, pet: puppy, approved: nil)
    
    visit "/admin/applications/#{joe.id}"

    expect(current_path).to eq "/admin/applications/#{joe.id}"
    click_button "Approve Adoption"
    pet_app.reload
  
    expect(current_path).to eq "/admin/applications/#{joe.id}"
    expect(page).to have_no_button("Approve Adoption")
    expect(page).to have_content("Approved!")
  end

  it 'I can reject a pet on an application'  do
    joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    pet_app = PetApplication.create!(application: joe, pet: puppy, approved: nil)
    
    visit "/admin/applications/#{joe.id}"

    expect(current_path).to eq "/admin/applications/#{joe.id}"
    click_button "Reject Adoption"
    pet_app.reload
  
    expect(current_path).to eq "/admin/applications/#{joe.id}"
    expect(page).to have_no_button("Approve Adoption")
    expect(page).to have_no_button("Reject Adoption")
    expect(page).to have_content("We are sorry to inform you your adoption has been rejected.")
  end

  it 'Approve/Reject on one application doesnt affect other applications' do
    joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
    dave = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
    
    shelter = create(:shelter)
    puppy = create(:pet, shelter: shelter)
    pet_app = PetApplication.create!(application: joe, pet: puppy, approved: nil)
    pet_app2 = PetApplication.create!(application: dave, pet: puppy, approved: nil)
    
    visit "/admin/applications/#{joe.id}"

    expect(current_path).to eq "/admin/applications/#{joe.id}"
    click_button "Reject Adoption"
    pet_app.reload
  
    visit "/admin/applications/#{dave.id}"
  
    expect(page).to have_button("Approve Adoption")
    expect(page).to have_button("Reject Adoption")
  end
end
end