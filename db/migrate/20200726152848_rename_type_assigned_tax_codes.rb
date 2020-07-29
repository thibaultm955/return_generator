class RenameTypeAssignedTaxCodes < ActiveRecord::Migration[6.0]
  def change
    rename_column :assigned_tax_codes, :type, :type_transaction
  end
end
