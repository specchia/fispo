class HomeController < ApplicationController
  def index
    @users = User.all
    @contents = Content.all
    @accounts=Account.all
    @sections = Section.all

  end

  def show
    @section = Section.find(params[:id])
    @top_sections = TopSection.all
    @contentz =   Content.find(:all, :conditions => ["section_id=?", params[:id]], :include => [:section,:top_section])
  end
end
