class AddDeclarationTypeProject < ActiveRecord::Migration[6.0]
  def change
    add_column :declarations, :type_of_project, :string
  end
end
