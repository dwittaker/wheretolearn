class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :currency, :enddate, :physaddress,
                  :pweburl, :schedtype_id, :source_id, :startdate, :subject_id, :subject_module_id, :costtype_id

  belongs_to :source, :inverse_of => :portfolios

  belongs_to :subject_module, :inverse_of => :portfolios
    delegate :smname, :smdesc, :to => :subject_module
  belongs_to :subject, :inverse_of => :portfolios
  belongs_to :costtype, :inverse_of => :portfolios
  belongs_to :schedtype, :inverse_of => :portfolios
  has_many :usedmethods, :as => :deliverable
  has_many :deliverymethods, :through => :usedmethods
  has_many :opinions, :as => :opinionable

  belongs_to :created_by, class_name: 'User' #, :inverse_of => :portfolios
  belongs_to :updated_by, class_name: 'User' #, :inverse_of => :portfolios

  def updater(user)
    self.updated_by_id = user.id
    self.save
  end

  def folioname
    self.source.name + " - " + self.subject.name + " : " + self.smname
  end


  #belongs_to :subject, :through => :subject_module
  #, :inverse_of => :portfolios
  attr_accessible :usedmethods_attributes

  accepts_nested_attributes_for :usedmethods , :reject_if => lambda { |a| a[:deliverymethod_id].blank? }, :allow_destroy => true

  validates_associated :usedmethods

  extend FriendlyId
  friendly_id self.source.name + " - " + self.subject.name + " : " + self.smname, use: :slugged
end
