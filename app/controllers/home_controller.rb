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
    @contents =   Content.find(:all, :conditions => ["section_id=?", params[:id]], :include => [:section,:top_section])
  end

  def main
    @contents = Content.all
    @accounts = Account.all
    @sections = Section.all

  end

  def show_article
      if account_signed_in?

        @section = Section.find(params[:id])
        @top_sections = TopSection.all
        @contents =   Content.find(:all, :conditions => ["id=?", params[:id]], :include => [:section,:top_section])
      else
         render  "home/subscription"
      end
  end

  def subscription

  end
  def vademecum

        @contents =   Content.find(:all, :conditions => ["section_id=?",16], :include => [:section,:top_section])
  end
  def modulistica

        @contents =   Content.find(:all, :conditions => ["section_id=?",18], :include => [:section,:top_section])
  end

end

