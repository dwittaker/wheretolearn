class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :costtype, :currency, :enddate, :method, :physaddress,
                  :pweburl, :schedtype, :source_id, :startdate, :subjectmodule_id

  belongs_to :source
  belongs_to :subjectmodule
  belongs_to :costtype
  has_many :usedmethods, :as => :deliverable

end
