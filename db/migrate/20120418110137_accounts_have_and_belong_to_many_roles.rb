class AccountsHaveAndBelongToManyRoles < ActiveRecord::Migration
  def up
    #rails geerate migration UsersHaveAndBelongToManyRoles
    #class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
    create_table :roles_accounts, :id => false do |t|
      t.references :role, :account
    end


  end

  def down
    drop_table :roles_accounts
    #drop_table :roles_users
  end
end

    # Account(User) Model
    #class Account < ActiveRecord::Base
    #  has_and_belongs_to_many :roles
    # Role model
    #class Role < ActiveRecord::Base
    #  has_and_belongs_to_many :accounts    (:users)
    #end


    #def initialize(account)
    #  ...
    #  can :manage, Topic if account.is? :moderator
    #  can :manage, Topic { |topic| if (topic.account_id == account.id) }
    #  ...
    #end

#all'inizio si pensava di usare github.com/martinrehfeld/role_model
#http://www.tonyamoyal.com/2010/07/28/rails-authentication-with-devise-and-cancan-customizing-devise-controllers/
#http://starqle.com/articles/rails-3-authentication-and-authorization-with-devise-and-cancan-part-2/




