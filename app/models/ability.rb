class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    can :read, :all
    can :manage, Food, user_id: user.id
    can :manage, Recipe, user_id: user.id
    can :manage, RecipeFood, recipe: { user_id: user.id }
  end
end
