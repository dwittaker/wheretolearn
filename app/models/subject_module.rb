class SubjectModule < ActiveRecord::Base
  attr_accessible :smdescription, :smname, 
  :order, :smpurpose, :subject_id, :slug

  belongs_to :subject, :inverse_of => :subject_modules
  has_many :contenttags, :as => :taggable
  has_many :portfolios, :inverse_of => :subject_module
  has_many :sources, through: :portfolios

  belongs_to :created_by, class_name: 'User', :inverse_of => :subject_modules
  belongs_to :updated_by, class_name: 'User', :inverse_of => :subject_modules

  validates :smname,             
  			:presence => true,
            :length => { :maximum => 100 }

  validates :smdescription,
            :presence => true,
            :length => { :maximum => 300 }

  validates :smpurpose,
            :presence => true,
            
            :length => { :maximum => 300, :minimum => 3 }

  validates_presence_of :subject
  #def new_record
  #	(self).new
  #end

  def subjtitle
    #smname + ' ' + smdescription
    self.subject.name + ' : ' + smname
  end

  def srchtitle
    subjtitle
  end

  def clstype
    "Subject Module"
  end

  def srchparent
    self.subject
  end

  def srchtext
    smdescription
  end



=begin
  extend FriendlyId
  friendly_id :smname, use: :slugged

  def should_generate_new_friendly_id?
    true
    #new_record?
  end
=end

  include PgSearch
  multisearchable :against => [:smdescription, :smname, :smpurpose]



  resourcify
end
