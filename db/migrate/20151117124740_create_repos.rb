class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :rid
      t.string :name
      t.string :full_name
      t.references :user, index: true, foreign_key: true
      t.string :html_url
      t.string :description
      t.string :owner
      t.string :owner_avatar_url
      t.string :owner_html_url

      t.timestamps null: false
    end
  end
end
