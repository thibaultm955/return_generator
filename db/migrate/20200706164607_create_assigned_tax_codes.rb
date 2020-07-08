class CreateAssignedTaxCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :assigned_tax_codes do |t|

      t.timestamps
    end
  end
end
