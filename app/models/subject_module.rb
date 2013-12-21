class SubjectModule < ActiveRecord::Base
  attr_accessible :category4, :category5, :description, :moduleid, :name, :order, :purpose, :subject_id, :subjectmodule_id

  belongs_to :subject
end
