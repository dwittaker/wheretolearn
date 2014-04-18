class Costtype < ActiveRecord::Base
  attr_accessible :costdesc, :costname

  has_many :portfolios, :inverse_of => :costtype

  resourcify
end
