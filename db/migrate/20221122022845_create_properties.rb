class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :rent_amount
      t.string :owner_name
      t.string :owner_address
      t.string :owner_phone_number
      t.boolean :in_rent, default: false
      t.integer :rent_payment_days

      t.timestamps
    end
  end
end
