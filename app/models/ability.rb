class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :manage, Project, user: user
    can :manage, Task, project: { user: user }
    can :manage, Comment, task: { project: { user: user } }
  end
end