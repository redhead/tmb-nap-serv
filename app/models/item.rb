class Item < ActiveRecord::Base
  attr_accessible :description, :lat, :lon, :price, :state, :title
  
  validates :title, :presence => true
  validates :state, :presence => true
  validates :price, :presence => true
  validates :lat, :presence => true
  validates :lon, :presence => true

  belongs_to :user
end
