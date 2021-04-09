class ApplicationPet < ApplicationRecord
  belongs_to :pet
  belongs_to :application
  validates :status, presence: true
end