class ApplicationController < ActionController::Base
  protect_from_forgery
  #protected
 #def authorize
  # unless Account.find_by_id(session[:account_id])
    #session[:original_uri] = request.request_uri
    #flash[:notice] = "Please Log In!"
   # redirect_to :controller => 'admin', :action => 'login'
  # end
 #end
end

