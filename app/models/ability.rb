class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.has_role? :admin
         # an admin can do everything
         can :manage, :all
       elsif user.has_role? :guest
         can :read, :all

       elsif user.has_role? :member
         can :read, :all
         can :create, Blogit::Post
         can :update, Blogit::Post
         can :destroy, Blogit::Post
         can :create, Opinion
         can :update, Opinion
         can :destroy, Opinion
         can :create, Contenttag
         can :update, Contenttag
         can :destroy, Contenttag

       elsif user.has_role? :sourcemgr
         can :read, :all
         can :create, Blogit::Post
         can :update, Blogit::Post
         can :destroy, Blogit::Post
         can :create, Source
         can :update, Source
         can :destroy, Source
         can :create, Portfolio
         can :update, Portfolio
         can :destroy, Portfolio
         can :create, Usedmethod
         can :update, Usedmethod
         can :destroy, Usedmethod



       elsif user.has_role? :subjectmgr
         can :read, :all
         can :create, Blogit::Post
         can :update, Blogit::Post
         can :destroy, Blogit::Post
         can :create, Subject
         can :update, Subject
         can :destroy, Subject
         can :create, Subject_Module
         can :update, Subject_Module
         can :destroy, Subject_Module
       end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
