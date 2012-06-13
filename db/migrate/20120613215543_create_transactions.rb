class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :origin
      t.integer :entity_id
      t.datetime :balance_date
      t.string :document_number
      t.string :value

      t.timestamps
    end
  end
end
