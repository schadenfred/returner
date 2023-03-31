class CreateAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :awards do |t|
      t.integer :granter_id
      t.integer :recipient_id
      t.integer :amount
      t.string :purpose
      t.string :tax_period_end_date

      t.timestamps
    end
  end
end
