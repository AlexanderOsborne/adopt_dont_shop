require 'rails_helper'

  describe 'As a visitor' do
    describe 'when I visit an applications show page' do
    it 'I see name of applicant, address and description' do

      joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
      shelter = create(:shelter)
      pet_1 = create(:pet, shelter: shelter)
      pet_2 = create(:pet, shelter: shelter)
      pet_app = PetApplication.create!(application: joe, pet: pet_1)

      visit "/applications/#{joe.id}"

      expect(page).to have_content(joe.name)
      expect(page).to have_content(joe.street_address)
      expect(page).to have_content(joe.city)
      expect(page).to have_content(joe.state)
      expect(page).to have_content(joe.zip)
      expect(page).to have_content("In Progress")
      expect(page).to have_content(pet_1.name)
    end

    it 'I can search for a pet and add it to the page'  do
      joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
      shelter = create(:shelter)
      puppy = create(:pet, shelter: shelter)
      kitteh = create(:pet, shelter: shelter)
      pet_app = PetApplication.create!(application: joe, pet: puppy, pet:kitteh)

      visit "/applications/#{joe.id}"
      fill_in "Add a Pet to this Application", with:"#{puppy.name}"
      click_on "Search"
      click_link "Adopt this Pet"

      expect(page).to have_content(puppy.name)
    end

    it 'When I have a pet, I can submit my application'  do
      joe = Application.create!(name: 'Joe', street_address: "12 Broadway", city: "Boulder", state: "CO", zip: 80303)
      shelter = create(:shelter)
      puppy = create(:pet, shelter: shelter)
      kitteh = create(:pet, shelter: shelter)
      pet_app = PetApplication.create!(application: joe, pet: puppy, pet:kitteh)

      visit "/applications/#{joe.id}"
      fill_in "Add a Pet to this Application", with:"#{puppy.name}"
      click_on "Search"
      click_link "Adopt this Pet"


      expect(page).to have_button("Submit")
      expect(page).to have_content("Pending")
    end

  end
end