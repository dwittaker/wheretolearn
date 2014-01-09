class SubjectModule < ActiveRecord::Base
  attr_accessible :description, :name, 
  :order, :purpose, :subject_id

  belongs_to :subject
  has_many :contenttags, :as => :taggable
  has_many :portfolios
  has_many :sources, through: :portfolios
end
