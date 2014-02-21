class SubjectModule < ActiveRecord::Base
  attr_accessible :smdescription, :smname, 
  :order, :smpurpose, :subject_id

  belongs_to :subject, :inverse_of => :subject_modules
  has_many :contenttags, :as => :taggable
  has_many :portfolios, :inverse_of => :subject_module
  has_many :sources, through: :portfolios


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
end
