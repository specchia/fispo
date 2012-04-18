module SessionsHelper
#Note: devise --> becareful. Do not use current_user but current_account 
#ActionView::Template::Error (undefined local variable or method `current_user'

#PROTECT PAGE using before_filter :authenticate, :only => [:edit, :update]
#  def sign_in(user)
#    user.remember_me!
#    cookies[:remember_token] = { :value   => user.remember_token, :expires => 20.years.from_now.utc }
#    self.current_account = user
#  def current_account=(user)
#    @current_account = user
#  def current_account
#    @current_account ||= user_from_remember_token #||= (“or equals”) assignment operator only if @current_account is undefined
#  def user_from_remember_token
#    remember_token = cookies[:remember_token]
#    User.find_by_remember_token(remember_token) unless remember_token.nil?
#  def signed_in?
#    !current_account.nil?
#  def sign_out
#    cookies.delete(:remember_token)
#    self.current_account = nil
#  def current_account?(user)
#    user == current_account

  def signed_in_and_master?
    signed_in? && (current_account.username == 'dom'  ||  current_account.username == 'specchia')
    signed_in? && (current_account.is? :admin)
  end

  def signed_in_and_manager?
    #signed_in? && (current_account.has_any_role? :admin, :manager)  
    signed_in? && (current_account.is_any_of? :admin, :manager)
  end

  def signed_in_and_collaboratore?
    signed_in? && (current_account.has_any_role? :admin, :manager, :collaboratore)  
    #signed_in? && (current_account.is_any_of? :admin, :manager, :collaboratore)
  end

  def can_content?(content_id)
    if !signed_in?
        return false 
    end
#TODO: verificare se un utente puo modifcare il contenuto di una news
#per il momento non c'è un field per tracciare chi è l'autore del contenuto
#in ogni modo ne possiamo creare uno. Pero che succede per gli altri nel passato?
#prevedere che il campo sia Null
#    news = Content.find(:first, :conditions => [ "id = ?", content_id])
#    if news and news.account_id = current_account.id
#        return true
#    end
    return signed_in_and_collaboratore?
  end

  def get_fisco_user
    if signed_in_and_master?
        User.find(1)
    else
        User.find(:first, :conditions => [ "user_id = ?", current_account.id])
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

