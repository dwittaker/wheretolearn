class SubjectModule < ActiveRecord::Base
  attr_accessible :smdescription, :smname, 
  :order, :smpurpose, :subject_id

  belongs_to :subject
  has_many :contenttags, :as => :taggable
  has_many :portfolios
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

  #def new_record
  #	(self).new
  #end
end
