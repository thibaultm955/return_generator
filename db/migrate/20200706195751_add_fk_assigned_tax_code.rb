class AddFkAssignedTaxCode < ActiveRecord::Migration[6.0]
  def change
    add_reference :assigned_tax_codes, :entity, foreign_key: true
    add_reference :assigned_tax_codes, :tax_code, foreign_key: true
  end
end
