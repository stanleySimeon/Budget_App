class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category
    can :create, Category
    can :write, Category

    can :read, Payment
    can :create, Payment

    return unless user.present?

    can :destroy, Category, user: user
    can :destroy, Payment, user: user
  end
end
