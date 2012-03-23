class AccountController < ApplicationController
 #before_filter :authenticate_account!

def show
  @account = Account.find(params[:id])
end
end
