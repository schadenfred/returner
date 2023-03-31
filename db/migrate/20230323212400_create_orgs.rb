class CreateOrgs < ActiveRecord::Migration[7.0]
  def change
    create_table :orgs do |t|
      t.string :ein
      t.string :name
      t.string :address
      t.string :line_1
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
