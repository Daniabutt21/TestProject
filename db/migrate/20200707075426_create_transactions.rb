class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :payment_date
      t.integer :total_charges
      t.boolean :bill_status
      t.string :resource_type
      t.integer :resource_id
      t.string :charge_type
      t.string :month
      t.integer :year
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
