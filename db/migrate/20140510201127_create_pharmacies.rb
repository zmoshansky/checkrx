class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :postal_code
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
