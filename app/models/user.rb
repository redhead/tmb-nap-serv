class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :password, :username
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
end
