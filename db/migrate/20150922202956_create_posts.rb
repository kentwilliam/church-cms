class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :markdown
      t.text :html
      t.datetime :published
      t.string :slug

      t.timestamps null: false
    end
  end
end
