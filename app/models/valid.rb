class Valid < ActiveRecord::Base
  attr_accessible :password, :username

  validates :password, :presence => true
end
