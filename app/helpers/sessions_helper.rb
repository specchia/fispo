module SessionsHelper

#TODO: Verificare se cambiare tutti current_user => current_account!

#PROTECT PAGE using before_filter :authenticate, :only => [:edit, :update]
#  def sign_in(user)
#    user.remember_me!
#    cookies[:remember_token] = { :value   => user.remember_token, :expires => 20.years.from_now.utc }
#    self.current_user = user
#  def current_user=(user)
#    @current_user = user
#  def current_user
#    @current_user ||= user_from_remember_token #||= (“or equals”) assignment operator only if @current_user is undefined
#  def user_from_remember_token
#    remember_token = cookies[:remember_token]
#    User.find_by_remember_token(remember_token) unless remember_token.nil?
#  def signed_in?
#    !current_user.nil?
#  def sign_out
#    cookies.delete(:remember_token)
#    self.current_user = nil
#  def current_user?(user)
#    user == current_user

  def signed_in_and_master?
    signed_in? && (current_user.username == 'dom'  ||  current_user.username == 'specchia')
    signed_in? && (current_user.is? :admin)
  end

  def signin_and_collaboratore?
    signed_in? && (current_user.has_any_role? :admin, :manager, :collaboratore)  
    #signed_in? && (current_user.is_any_of? :admin, :manager, :collaboratore)
  end

  def get_fisco_user
    if signed_in_and_master?
        User.find(1)
    else
        User.find(:first, :conditions => [ "user_id = ?", current_user.id])
    end
  end

  def deny_access_destroy
    flash[:notice] = "Sorry. Only technical manager can delete data. Please, contact Roberto SPURIO to do it."
    redirect_to request.request_uri
  end
  def deny_access
    store_location  #Friendly forwarding
    flash[:notice] = "Please sign in to access this page."
    redirect_to signin_path
  end
  #Friendly forwarding
  def store_location
    #puts the requested URL in the session variable under the key :return_to
    session[:return_to] = request.request_uri
  end
  #redirect to the requested URL if it exists, or some default URL otherwise.
  #This method is needed in the Session create action to redirect after successful signin
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    #clear_return_to
  end
  def clear_return_to
    session[:return_to] = nil
  end

end

