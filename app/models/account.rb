class Account < ActiveRecord::Base
#before_filter :authenticate_account!
#account_signed_in?
#current_account
#account_session

    #FiscoSport User
    has_one :user

    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :authentication_keys => [ :login ]

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :username , :login, :role_ids
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    attr_accessor :login

    def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
    end


    #
    #Roles with cancan http://starqle.com/articles/rails-3-authentication-and-authorization-with-devise-and-cancan-part-2/
    # add attr_accessible :role_ids
    #
    has_and_belongs_to_many :roles
    def role?(role)
        return !!self.roles.find_by_name(role.to_s.camelize)
    end

    #
    # ROLES https://github.com/martinrehfeld/role_model
    #
    attr_accessor :roles_mask # in real life this would be an persisted attribute
    include RoleModel    #Include vs Require
    # optionally set the integer attribute to store the roles in, :roles_mask is the default
    roles_attribute :roles_mask
    # declare the valid roles -- do not change the order if you add more roles later, always append them at the end!
    roles :admin, :manager, :collaboratore, :abbonato 
    #Use it:  u = Account.new
    # role assignment     u.roles = [:admin]  u.roles = ['admin']
    # adding roles (remove via delete or re-assign)       u.roles << :manager
    # querying roles...
    # get all valid roles that have been declared   Account.valid_roles  => [:admin, :manager, :collaboratore, :abbonato]
    # ... retrieve all assigned roles  u.roles  => [:admin, :manager]
    # ... check for individual roles   u.has_role? :author  => false       u.is? :admin  => true
    # ... check for multiple roles     u.has_any_role? :author, :manager   u.is_any_of? :author, :manager  => true
    #                                  u.has_all_roles? :author, :manager  u.is? :author, :manager  => false

    #
    # Forum: gem 'forem'
    #
    #Added fields account.forem_admin and account.forem_state during forem install
    #db/migrate done

    #
    #https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
    #
    protected

         # Attempt to find a user by it's email. If a record is found, send new
         # password instructions to it. If not user is found, returns a new user
         # with an email not found error.
         def self.send_reset_password_instructions(attributes={})
           recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
           recoverable.send_reset_password_instructions if recoverable.persisted?
           recoverable
         end

         def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
           (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

           attributes = attributes.slice(*required_attributes)
           attributes.delete_if { |key, value| value.blank? }

           if attributes.size == required_attributes.size
             if attributes.has_key?(:login)
                login = attributes[:login]
                record = find_record(login)
             else
               record = where(attributes).first
             end
           end

           unless record
             record = new

             required_attributes.each do |key|
               value = attributes[key]
               record.send("#{key}=", value)
               record.errors.add(key, value.present? ? error : :blank)
             end
           end
           record
         end

         def self.find_record(login)
           where(["username = :value OR email = :value", { :value => login }]).first
         end

end
