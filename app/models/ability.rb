class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user.logger?

    can :manage, :all
    can :read, :all
  end
end
