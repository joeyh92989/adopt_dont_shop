class ApplicationPet < ApplicationRecord
  belongs_to :pet
  belongs_to :application
  validates :status, presence: true

  
  def self.status_check(pet_id, app_id)
    binding.pry
    (self.where('pet_id = ? AND application_id = ?',pet_id,app_id))[0].status
  end


end