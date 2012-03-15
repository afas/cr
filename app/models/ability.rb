class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    case user.role_id
      when 0
        #admin
        can :index, User
        can :manage, :all
      when 1
        #manager
        can :create, Flat
        can :create, Tender
        can :by_metro, Metro

        can :read, :all
      when 2
        #rentor
        can :create, Flat
        can :create, Tender
        can :by_metro, Metro

        can :read, :all
      else
        #all
        can [:create, :index, :show], Flat
        can [:create, :show], Tender
        can :by_metro, Metro
    end
  end
end
