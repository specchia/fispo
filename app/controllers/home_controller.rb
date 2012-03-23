class HomeController < ApplicationController
  def index
    @users = User.all
    @contents = Content.all
    @accounts=Account.all
  end
end
