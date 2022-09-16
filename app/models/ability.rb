class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.logger?
      can :manage, :all
      can :read, :all
      can :manage, Payment, user_id: user.id
      can :manage, Category, user_id: user.id
    end
  end
end
