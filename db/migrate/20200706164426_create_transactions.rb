class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :gross_amount
      t.decimal :net_amount
      t.decimal :vat_amount
      t.string :business_partner_vat_number
      t.string :business_partner_name

      t.timestamps
    end
  end
end
