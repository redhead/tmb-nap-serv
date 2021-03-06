class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :password, :username
  
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true

  has_many :items
end
