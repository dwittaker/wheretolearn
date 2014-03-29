class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  # attr_accessible :title, :body
  has_many :opinions


  has_many :portfolios, foreign_key: 'created_by_id' #, :inverse_of => :user
  has_many :updated_portfolios, foreign_key: 'updated_by_id' #, :inverse_of => :user


  has_many :sources, foreign_key: "created_by_id"#, :inverse_of => :user
  has_many :updated_sources, foreign_key: "updated_by_id"


  has_many :subjects, foreign_key: 'created_by_id' #, :inverse_of => :user
  has_many :updated_subjects, foreign_key: 'updated_by_id' #, :inverse_of => :user

=begin
  has_many :created_subject_modules, :foreign_key => 'created_by_id', :inverse_of => :user
  has_many :updated_subject_modules, :foreign_key => 'updated_by_id', :inverse_of => :user
=end




  blogs #added for blogit

  def full_name
    first_name + ' ' + last_name
  end

  def username
    profile_name
  end

  def login_required


  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{hash}"
  end




  extend FriendlyId
  friendly_id :profile_name
end
