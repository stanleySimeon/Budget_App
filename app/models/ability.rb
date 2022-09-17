class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all
    can :manage, :all

    return unless user.present?

    can :destroy, Category, user: user
    can :destroy, Payment, user: user
  end
end
