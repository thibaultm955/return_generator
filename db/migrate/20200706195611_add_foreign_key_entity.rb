class AddForeignKeyEntity < ActiveRecord::Migration[6.0]
  def change
    add_reference :entities, :company, foreign_key: true
  end
end
