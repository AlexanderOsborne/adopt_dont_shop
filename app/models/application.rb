class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  validates_presence_of :name, :street_address, :state, :zip, :city
end