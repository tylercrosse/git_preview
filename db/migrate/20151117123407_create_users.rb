class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :name
      t.string :nickname
      t.string :uid
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
