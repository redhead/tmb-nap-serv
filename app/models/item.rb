class Item < ActiveRecord::Base
  attr_accessible :description, :lat, :lon, :price, :state, :title
end
