class Schedtype < ActiveRecord::Base
  attr_accessible :scheddesc, :schedname

  has_many :portfolios, :inverse_of => :schedtype
end
