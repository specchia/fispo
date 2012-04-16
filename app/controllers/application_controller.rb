class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_dummy
    render :text => "Content", :layout => true
  end
    def render_01
      render :partial => "home/main_page"
  end
end

