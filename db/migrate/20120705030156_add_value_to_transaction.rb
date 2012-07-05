class AddValueToTransaction < ActiveRecord::Migration
  def up
    add_column :transactions, :value, :float
  end

  def down
    remove_column :transactions, :value
  end
end
