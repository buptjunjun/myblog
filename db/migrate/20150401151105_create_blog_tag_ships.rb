class CreateBlogTagShips < ActiveRecord::Migration
  def change
    create_table :blog_tag_ships do |t|
      t.integer :blog_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
