class Addbloghtml < ActiveRecord::Migration
  def change
    add_column :blogs ,:html,:string
  end
end
