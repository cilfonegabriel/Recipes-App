class Ability
  include CanCan::Ability

  def initialize(user)
    can(:read, Recipe, public: true)
    can(:read, User)

    return unless user.present?

    can(%i[read create update destroy], Recipe, user:)
    can(%i[read create destroy], Food, user:)
  end
end
