Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

    #Shelters
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new", as: :shelters_new
  get "/shelters/:id", to: "shelters#show", as: :shelters_show
  delete "/shelters/:id", to: "shelters#destroy"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit", as: :shelters_edit
  patch "/shelters/:id", to: "shelters#update"

  #Pets
  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show", as: :pets_show
  get "/pets/:id/edit", to: "pets#edit", as: :pets_edit
  patch "/pets/:id", to: "pets#update"
  delete "/pets/:id", to: "pets#destroy"

  #ShelterPets
  get "/shelters/:shelter_id/pets", to: "shelter_pets#index", as: :shelter_pets
  get "/shelters/:shelter_id/pets/new", to: "shelter_pets#new", as: :shelter_pets_new
  post "/shelters/:shelter_id/pets", to: "shelter_pets#create"
  get "/shelters/:id/pets/:id", to: "pets#show"

  #Applications
  get "/applications", to: "applications#index", as: :applications
  get "applications/new", to: "applications#new", as: :applications_new
  get "/applications/:id/edit", to: "applications#edit", as: :applications_edit
  get "/applications/:id", to: "applications#show", as: :applications_show
  post "/applications", to: "applications#create"
 

  #PetApplications


end

