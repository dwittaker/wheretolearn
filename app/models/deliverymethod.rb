class Deliverymethod < ActiveRecord::Base
  attr_accessible :dmcod, :dmdesc, :dmimgh, :dmimgtype, :dmimgurl, :dmimgw

  has_many :usedmethods, :inverse_of => :deliverymethod
end
