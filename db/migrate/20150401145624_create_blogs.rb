class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.string :content
      t.boolean :is_publish

      t.timestamps null: false
    end
  end
end
