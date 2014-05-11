class Role < ActiveRecord::Base

  ##has_and_belongs_to_many :users, :through => :usersrole
  belongs_to :resource, :polymorphic => true

  has_many :usersroles, :inverse_of => :Role
  
  scopify
  # attr_accessible :title, :body

=begin
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by_id' #, :inverse_of => :portfolios
  belongs_to :updater, class_name: 'User', foreign_key: 'updated_by_id' #, :inverse_of => :portfolios
=end

  def add_role(role_name, resource = nil)
    super



  end

end
