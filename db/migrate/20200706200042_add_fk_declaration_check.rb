class AddFkDeclarationCheck < ActiveRecord::Migration[6.0]
  def change
    add_reference :declaration_checks, :transaction, foreign_key: true
    add_reference :declaration_checks, :check, foreign_key: true
  end
end
