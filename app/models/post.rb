class Post < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :title
  validates_presence_of :content
end
