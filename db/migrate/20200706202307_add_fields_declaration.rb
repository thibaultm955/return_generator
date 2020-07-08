class AddFieldsDeclaration < ActiveRecord::Migration[6.0]
  def change
    add_column :declarations, :box_name, :string
    add_column :declarations, :amount, :float
  end
end
