class Usedmethod < ActiveRecord::Base
  belongs_to :deliverymethod
  belongs_to :deliverable, :polymorphic => true

   attr_accessible :deliverymethod_id
end
