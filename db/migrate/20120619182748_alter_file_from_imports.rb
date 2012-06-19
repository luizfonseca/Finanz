class AlterFileFromImports < ActiveRecord::Migration
  def up
    change_column :imports, :file, :text
  end

  def down
    change_column :imports, :file, :string
  end
end
