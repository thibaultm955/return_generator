class AddFkTransaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :tax_code, foreign_key: true
    add_reference :transactions, :declaration, foreign_key: true
  end
end
