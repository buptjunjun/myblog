class BlogTagShip < ActiveRecord::Base
  belongs_to :tag
  belongs_to :blog
end
