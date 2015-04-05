class Tag < ActiveRecord::Base
  has_many :tags ,:through => :blog_tag_ships
  has_many :blog_tag_ships
end
