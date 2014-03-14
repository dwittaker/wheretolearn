class Subject < ActiveRecord::Base
  attr_accessible :subject_id, :name, :description, :purpose, :complexity, 
  :category1_id, :category2_id, :category3_id, :avgtimetolearn
  has_many :subject_modules, :inverse_of => :subject
  has_many :portfolios
  has_many :sources, through: :portfolios
  belongs_to :category1
  	delegate :cat1cod, :cat1desc, :to => :category1
  belongs_to :category2
  	delegate :cat2cod, :cat2desc, :to => :category2
  belongs_to :category3
	delegate :cat3cod, :cat3desc, :to => :category3
  has_many :contenttags, :as => :taggable
  attr_accessible :subject_modules_attributes

  has_many :portfolios, :through => :subject_modules, :inverse_of => :subject

  attr_accessible :subject_modules_attributes

  accepts_nested_attributes_for :subject_modules, :reject_if => lambda { |a| a[:smname].blank? }, :allow_destroy => true



    validates :name,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :length => { :maximum => 50, :minimum => 3 }

    validates :description,
            :presence => true,
            
            :length => { :maximum => 300, :minimum => 3 }

    validates :purpose,
            :presence => true,
            
            :length => { :maximum => 300, :minimum => 3 }

    validates :complexity,
            :presence => true,
            :inclusion => { :in => 1..10, :message => "must be between 1 and 10" }

    validates :avgtimetolearn,
            :presence => true,
            :inclusion => { :in => 1..365, :message => "must be between 1 and 365" }   

  #def new_subject_module_attributes=(subject_modules_attributes)
  #  subject_module_attributes.each do |attributes|
  #    subject_modules.build(attributes)
  #  end
  #end

  #def existing_subject_module_attributes=(subject_modules_attributes)
  #  subject_modules.reject(&:new_record?).each do |subject_module|
  #    attributes = subject_module_attributes[subject_module.id.to_s]
  #    if attributes['_delete'] == '1'
  #      subject_modules.delete(subject_module)
  #    else
  #      subject_module.attributes = attributes
  #    end
  #  end
  #end

  private

  def save_subject_modules
    subject_modules.each do |subject_module|
      subject_module.save(false)
    end
  end



#after_update :save_subject_modules
validates_associated :subject_modules

  


end
