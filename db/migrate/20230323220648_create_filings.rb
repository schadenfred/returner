class CreateFilings < ActiveRecord::Migration[7.0]
  def change
    create_table :filings do |t|
      t.integer :filer_id
      t.string :return_timestamp
      t.string :tax_period_end_date

      t.timestamps
    end
  end
end
