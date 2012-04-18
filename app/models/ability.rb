class Ability
  include CanCan::Ability
 
  def initialize(account)
    account ||= Account.new # guest user

    #The level of authorizations  :create, :read, :update, :delete, :manage

    #roles :admin, :manager, :collaboratore, :abbonato 
    if account.role? :admin
      can :manage, :all   #[Role, ]
<<<<<<< HEAD
    elsif account.role? :manager
      can :read, :all
      can :manage, [Account, User, Content, Section, TopSection]
    elsif account.role? :collaboratore
      can :read, :all
      can :manage, [Account, User, Content]
    elsif account.role? :abbonato
      can :read, :all     #can access the index or show action of either of those models
=======
      can :see_timestamps, Account
    elsif account.role? :manager
      can :read, :all
      can :manage, [Account, User, Content, Section, TopSection]
      can :see_timestamps, Account
    elsif account.role? :collaboratore
      can :read, :all
      can :see_timestamps, Account, :id => account.id      
      can :manage, [Account, User, Content]
    elsif account.role? :abbonato
      can :read, :all     #can access the index or show action of either of those models
      can :see_timestamps, Account, :id => account.id      
>>>>>>> origin/domthu-roles
      # manage products, assets he owns
      can :manage, Content do |content|
        content.try(:owner) == account
      end
#      can :manage, Asset do |asset|
#        asset.assetable.try(:owner) == account
#      end
    else
      #can :read, :all
      can :read, [Content]
<<<<<<< HEAD
    end
=======
      can :see_timestamps, Account, :id => account.id      
    end

>>>>>>> origin/domthu-roles
  end
end

#Adding authorization
#Finally, in every controller that needs authorization, we add this line:
#load_and_authorize_resource
