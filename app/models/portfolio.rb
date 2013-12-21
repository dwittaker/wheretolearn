class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :costtype, :currency, :enddate, :method, :physaddress, :portfolioid, :pweburl, :schedtype, :sourceid, :startdate, :subjectid, :moduleid

  belongs_to :source, :subject
end
