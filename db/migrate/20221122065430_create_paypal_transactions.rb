class CreatePaypalTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :paypal_transactions do |t|
      t.references :user_property, index: true
      t.string :order_id
      t.date :date

      t.timestamps
    end
  end
end
