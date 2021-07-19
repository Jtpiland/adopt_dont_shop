class CreateAdoptionApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :adoption_applications do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.text :description
      t.string :pets_applied_for
      t.string :status
    end
  end
end
