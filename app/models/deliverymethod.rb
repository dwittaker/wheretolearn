class Deliverymethod < ActiveRecord::Base
  attr_accessible :dmcod, :dmdesc, :dmimgh, :dmimgtype, :dmimgurl, :dmimgw

  has_many :usedmethods, :inverse_of => :deliverymethod
  has_many :portfolios, :through => :usedmethods

  resourcify
end
