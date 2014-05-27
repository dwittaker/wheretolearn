
Blogit::Post.class_eval do


  def srchtitle
    title
  end

  def clstype
    "Blog"
  end


  def srchtext
    body
  end


  extend FriendlyId
  friendly_id :title, use: :slugged


  include PgSearch
  multisearchable :against => [:title, :body]

=begin
    pg_search_scope :search_by_basic, :against => [:title, :body, :tag_list],
                    :associated_against => {:blogger => :first_name, :comments => :name, :comments => :body}
=end

  pg_search_scope :search_by_basic, :against => [:title, :body] ,

                  :associated_against => { :comments => :name, :comments => :body}
#TODO: setup associated scope to allow search on blogger - user

  resourcify

end
