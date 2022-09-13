class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.logged?
    can :manage, Category, user_id: user.id
    can :manage, Payment, user_id: user.id
  end
end
