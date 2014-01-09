class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :costtype, :currency, :enddate, :method, :physaddress, 
  :portfolioid, :pweburl, :schedtype, :sourceid, :startdate, :subjectmodule_id

  belongs_to :source
  
  belongs_to :subjectmodule
end
