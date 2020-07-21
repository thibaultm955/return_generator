class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :adress
      t.string :postal_code
      t.string :city
      t.string :vat_number
      t.string :jurisdiction

      t.timestamps
    end
  end
end
