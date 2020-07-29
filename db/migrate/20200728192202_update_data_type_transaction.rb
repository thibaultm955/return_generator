class UpdateDataTypeTransaction < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :gross_amount, :float
    change_column :transactions, :net_amount, :float
    change_column :transactions, :vat_amount, :float
  end
end
