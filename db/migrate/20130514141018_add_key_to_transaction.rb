class AddKeyToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :key, :string

  end
end
