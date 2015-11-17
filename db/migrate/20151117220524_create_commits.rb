class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :committer_name
      t.string :committer_date
      t.string :committer_avatar_url
      t.string :commit_message
      t.string :url
      t.string :html_url
      t.string :image

      t.references :user, index: true, foreign_key: true
      t.references :repo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
