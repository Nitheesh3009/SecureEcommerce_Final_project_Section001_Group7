class CreateUserProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :user_properties do |t|
      t.references :property
      t.references :user
      t.date :date
      t.integer :status, default: 0
      t.date :next_billing_date

      t.timestamps
    end
  end
end
