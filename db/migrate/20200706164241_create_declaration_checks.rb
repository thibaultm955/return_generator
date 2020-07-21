class CreateDeclarationChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :declaration_checks do |t|
      t.integer :line_passed
      t.integer :line_did_not_passed
      t.integer :number_line_passed

      t.timestamps
    end
  end
end
