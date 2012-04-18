
#http://www.tonyamoyal.com/2010/07/28/rails-authentication-with-devise-and-cancan-customizing-devise-controllers/

class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :nome
      t.text :descrizione

      t.timestamps
    end

    #class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
    create_table :roles_users, :id => false do |t|
      t.references :role, :user
    end

  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end

    # Account(User) Model
    #class Account < ActiveRecord::Base
    #  has_and_belongs_to_many :roles
    # Role model
    #class Role < ActiveRecord::Base
    #  has_and_belongs_to_many :accounts    (:users)
    #end


    #def initialize(user)
    #  ...
    #  can :manage, Topic if user.is? :moderator
    #  can :manage, Topic { |topic| if (topic.user_id == user.id) }
    #  ...
    #end

#finalmente useremo github.com/martinrehfeld/role_model

end
