class RemoveTaxCodeIdFromAssignedTaxCodes < ActiveRecord::Migration[6.0]
  def change
    remove_column :assigned_tax_codes, :tax_code_id
  end
end
