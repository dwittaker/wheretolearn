class Portfolio < ActiveRecord::Base
  attr_accessible :cost, :currency, :enddate, :physaddress,
                  :pweburl, :schedtype_id, :source_id, :startdate, :subject_id, :subject_module_id, :costtype_id, :slug,
                  :prttitle, :prtdesc

  belongs_to :source, :inverse_of => :portfolios
    delegate :srcname, :to => :source
  belongs_to :subject_module, :inverse_of => :portfolios
    delegate :smname, :smdesc, :to => :subject_module
  belongs_to :subject, :inverse_of => :portfolios
    delegate :subname, :to => :subject
  belongs_to :costtype, :inverse_of => :portfolios
    delegate :costname, :to => :costtype
  belongs_to :schedtype, :inverse_of => :portfolios
    delegate :schedname, :to => :schedtype
  has_many :usedmethods, :as => :deliverable
  has_many :deliverymethods, :through => :usedmethods
    delegate :dmdesc, :to => :deliverymethods
  has_many :opinions, :as => :opinionable



  belongs_to :created_by, class_name: 'User' #, :inverse_of => :portfolios
  belongs_to :updated_by, class_name: 'User' #, :inverse_of => :portfolios

  def updater(user)
    self.updated_by_id = user.id
    self.save
  end

def folioname
  srcname.to_s + " - " + subname.to_s + " : " + smname.to_s
end

def ttlname
  srcname.to_s + " - " + subname.to_s
end

  def srchtitle
    folioname
  end

  def clstype
    "Portfolio"
  end

  def srchparent
    self.source
  end

  def srchtext
    prtdesc
  end


  #belongs_to :subject, :through => :subject_module
  #, :inverse_of => :portfolios
  attr_accessible :usedmethods_attributes

  accepts_nested_attributes_for :usedmethods , :reject_if => lambda { |a| a[:deliverymethod_id].blank? }, :allow_destroy => true

  validates_associated :usedmethods

  extend FriendlyId
  friendly_id :folioname, use: :slugged
  #TODO: Need to decide whether to keep folioname based on source - subject : module or use title and desc

  include PgSearch
  multisearchable :against => [:cost, :currency, :enddate, :physaddress, :pweburl, :startdate, :prttitle, :prtdesc]
  pg_search_scope :search_by_basic, :against => [:cost, :currency, :enddate, :physaddress,:pweburl, :startdate, :prttitle, :prtdesc],
                  :associated_against => {:source => :name, :subject => :name, :subject_module => :smname, :opinions => [:optitle,:comment,:rating]
                  }
  #TODO: Configure rating to not require decimals
end
