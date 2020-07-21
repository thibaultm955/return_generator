class AddFkDeclaration < ActiveRecord::Migration[6.0]
  def change
    add_reference :declarations, :entity, foreign_key: true
  end
end
