class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :currency, :enddate, :method, :physaddress,
                  :pweburl, :schedtype, :source_id, :startdate, :subjectmodule_id, :costtype_id

  belongs_to :source
  belongs_to :subjectmodule
  belongs_to :costtype
  has_many :usedmethods, :as => :deliverable

end
