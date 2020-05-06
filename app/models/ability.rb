# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Script, public: true

    if user.present?  # additional permissions for logged in users (they can read their own posts)
      can :read, Script, user_id: user.id

      if user.admin?  # additional permissions for administrators
        can :read, Script
      end
    end
  end
end
