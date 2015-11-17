class AddColumnsToRepo < ActiveRecord::Migration
  def change
    add_column :repos, :git_created_at, :string
    add_column :repos, :git_updated_at, :string
    add_column :repos, :git_pushed_at, :string
  end
end
