class Usedmethod < ActiveRecord::Base
  belongs_to :deliverymethod, :inverse_of => :usedmethods
  belongs_to :deliverable, :polymorphic => true

   attr_accessible :deliverymethod_id

  validates_uniqueness_of :deliverymethod_id, scope: [:deliverable_id, :deliverable_type]

  resourcify
end
