class AddStatusToPetAdoptionApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_adoption_applications, :status, :string
  end
end
