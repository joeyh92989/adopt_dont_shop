class UpdateApplicationPets < ActiveRecord::Migration[5.2]
  def change
    change_table :application_pets do |t|
      t.string :status, default: "In Progress"
    end
  end
end
