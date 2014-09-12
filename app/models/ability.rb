class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Note, user: user if user
  end
end
