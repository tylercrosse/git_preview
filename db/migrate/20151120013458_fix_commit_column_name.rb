class FixCommitColumnName < ActiveRecord::Migration
  def change
    rename_column :commits, :image, :screenshot
  end
end
