class ApplicationController < ActionController::Base

  #before_filter :set_user_time_zone
  protect_from_forgery

  #def set_user_time_zone
  #  Time.zone = current_account.time_zone if account_signed_in?
  #end
  #min = cookies[:timezone].to_i
  #Time.zone = ActiveSupport::TimeZone[-min.minutes]


  #Add during forem installazione. To matche the <user model> --> Account
  def forem_user
    #:current_account
    @current_account
  end
  helper_method :forem_user
  #Add fields account.forem_admin and account.forem_state

  def render_dummy
    render :text => "Content", :layout => true
  end

  def render_01
      render :partial => "home/sect01"
  end
end

