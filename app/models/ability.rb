class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # user permissions
    can :manage, User, id: user.id
    can :manage, Order, user_id: user.id
    can :manage, Product

  end

end
