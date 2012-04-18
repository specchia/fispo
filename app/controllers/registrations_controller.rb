#http://www.tonyamoyal.com/2010/07/28/rails-authentication-with-devise-and-cancan-customizing-devise-controllers/
#Use custom cancan chek permissions if we want to keeping registration private


class Accounts::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication
 
  def check_permissions
    authorize! :create, resource
  end
end

#The check permissions method is really simple. It calls the CanCan method, authorize!, and checks if the current user can create users. We use resource here because devise uses resource to refer to the model that can be authenticated. Also notice how I removed the require_no_authentication filter, a Devise filter which allows access to actions without authentication.

# Use it: replace devise_for :users with:
#devise_for :users,  :controllers => { :registrations => "users/registrations" }
