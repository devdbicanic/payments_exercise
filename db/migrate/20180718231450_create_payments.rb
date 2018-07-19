class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :loan, foreign_key: true

      t.timestamps
    end
  end
end
