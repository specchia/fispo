class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_dummy
    render :text => "<h2>Sezione back end sperimentale (idea prima di redmine) </h2>" , :layout => true
  end
    def render_01
      render :partial => "home/main_page"
  end
end

