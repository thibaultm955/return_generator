class CreateTaxCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_codes do |t|
      t.string :jurisdiction
      t.string :name
      t.string :tax_code
      t.float :rate

      t.timestamps
    end
  end
end
