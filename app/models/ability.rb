class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role?(:admin)
      can :manage, :all
    else
      can :read, :all

      if user.role?(:author)
        can :create, Ringtone
        # can :update, Article do |article| 
        #   article.try(:user) == user 
        # end 
      end 
    end

  end



  # def initialize(user)
  #   # Define abilities for the passed in user here. For example:
  #   #
  #   user ||= User.new # guest user (not logged in)
  #   if user.is?(:admin)
  #     can :manage, :all
  #   else
  #     can :read, :all

  #     if user.is?(:author)
  #       can :create, Article
  #       can :update, Article do |article| 
  #         article.try(:user) == user 
  #       end 
  #     end 
  #   end
  # end


end
