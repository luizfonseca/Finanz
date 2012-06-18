class AddUserIdToImports < ActiveRecord::Migration
  def change
    add_column :imports, :user_id, :integer
  end
end
