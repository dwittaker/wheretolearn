class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :currency, :enddate, :method, :physaddress,
                  :pweburl, :schedtype_id, :source_id, :startdate, :subjectmodule_id, :costtype_id

  belongs_to :source, :inverse_of => :portfolios
  belongs_to :subject_module, :inverse_of => :portfolios
    delegate :smname, :smdesc, :to => :subject_module
  belongs_to :costtype, :inverse_of => :portfolios
  belongs_to :schedtype, :inverse_of => :portfolios
  has_many :usedmethods, :as => :deliverable

  accepts_nested_attributes_for :usedmethods #, :reject_if => lambda { |a| a[:smname].blank? }, :allow_destroy => true

end
