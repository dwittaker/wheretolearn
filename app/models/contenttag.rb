class Contenttag < ActiveRecord::Base
  belongs_to :taggable, :polymorphic => true
  attr_accessible :ctagdesc
end
