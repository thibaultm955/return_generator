class AddTransactionDateToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :transaction_date, :date
  end
end
