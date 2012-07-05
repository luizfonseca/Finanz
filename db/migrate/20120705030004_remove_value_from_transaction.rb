class RemoveValueFromTransaction < ActiveRecord::Migration
  def up
    remove_column :transactions, :value
  end

  def down
    add_column :transactions, :value, :string
  end
end
