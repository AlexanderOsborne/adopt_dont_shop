class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }
  enum sex: [:female, :male]

  def self.search(search)
      key = "%#{search}%".downcase
      where("LOWER(name) like :search", search: key)
  end

  # def self.find_pet_applications(:id])
  #   pet.pet_applications
  # end
end
