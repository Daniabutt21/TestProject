class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :name
      t.integer :code
      t.integer :unit_price
      t.integer :max_unit_limit
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
