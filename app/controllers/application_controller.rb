class ApplicationController < ActionController::Base

  #Add during forem installazione. To matche the <user model> --> Account
  def forem_user
    :current_account
  end
  helper_method :forem_user
  #Add fields account.forem_admin and account.forem_state

  protect_from_forgery

  def render_dummy
    render :text => "Content", :layout => true
  end
    def render_01
      render :partial => "home/sect01"
  end
end

