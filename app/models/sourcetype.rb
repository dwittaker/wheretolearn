class Sourcetype < ActiveRecord::Base
  attr_accessible :stcod, :stdesc
  has_many :sources

  resourcify
end
