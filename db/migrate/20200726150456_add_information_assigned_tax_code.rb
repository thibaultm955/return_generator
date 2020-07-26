class AddInformationAssignedTaxCode < ActiveRecord::Migration[6.0]
  def change
    add_column :assigned_tax_codes, :side, :string
    add_column :assigned_tax_codes, :localization, :string
    add_column :assigned_tax_codes, :rate, :string
    add_column :assigned_tax_codes, :type, :string
  end
end
