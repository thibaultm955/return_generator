class AddNameAssignedTaxCode < ActiveRecord::Migration[6.0]
  def change
    add_column :assigned_tax_codes, :name, :string
  end
end
