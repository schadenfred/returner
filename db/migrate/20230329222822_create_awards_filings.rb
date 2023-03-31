class CreateAwardsFilings < ActiveRecord::Migration[7.0]
  def change
    create_table :awards_filings do |t|
      t.belongs_to :award, null: false, foreign_key: true
      t.belongs_to :filing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
