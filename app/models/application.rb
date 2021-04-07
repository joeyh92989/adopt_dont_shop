class Application < ApplicationRecord
  validates :name_of_applicant, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  has_many :application_pets
  has_many :pets, through: :application_pets
end