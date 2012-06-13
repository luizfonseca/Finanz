class AddImportIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :import_id, :integer
  end
end
