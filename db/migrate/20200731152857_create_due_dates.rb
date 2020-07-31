class CreateDueDates < ActiveRecord::Migration[6.0]
  def change
    create_table :due_dates do |t|
      t.string :jurisdiction
      t.string :type_of_project
      t.date :start_date
      t.date :end_date
      t.date :statutory_due_date
      t.date :payment_due_date

      t.timestamps
    end
  end
end
