class AddFkTaxCode < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :assigned_tax_code, foreign_key: true
    remove_column :transactions, :tax_code_id
  end
end
