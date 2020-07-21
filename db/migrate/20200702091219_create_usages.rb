class CreateUsages < ActiveRecord::Migration[6.0]
  def change
    create_table :usages do |t|
      t.integer :no_of_units_used
      t.string :month
      t.integer :year
      t.references :feature, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
