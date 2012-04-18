class AccountController < ApplicationController

  #devise
  before_filter :authenticate_account!
  #cancan
  load_and_authorize_resource

  #cancan other filter  using SessionHelper get_account and accessible_roles
  before_filter :get_account, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
  #CanCan provides the class level accessible_by method to retrieve all accounts that can be viewed by the current account.   
  #The load_and_authorize_resource filter provided by CanCan actually does this accessibility filtering for you to keep things DRY and it recognizes collections as of this issue fix. 
  #The other two filters – get_account and accessible_roles – are in SessionHelper

  # GET /accounts
  # GET /accounts.xml
  # GET /accounts.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    #@accounts = Account.all
    #I support sorting in my actual code so I didn’t want to use the CanCan filter to grab my account objects in the index action.
    #@accounts = Account.accessible_by(current_ability, :index).limit(20)
    @accounts = Account.accessible_by(current_ability, :index).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
      format.json { render :json => @accounts }
    end
  end
 
#  rescue ActiveRecord::RecordNotFound
#    respond_to_not_found(:json, :xml, :html)
#  end
#respond_to_not_found is an application wide helper used to respond when a requested object is not found. From Fat Free CRM code.

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new
    @current_method = "new"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to(@account, :notice => 'Account was successfully created.') }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    #@account = Account.find(params[:id])
    if params[:account][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:account].delete(p) }
    else
      @account.errors[:base] << "La password inserita non &egrave; corretta" unless @account.valid_password?(params[:account][:current_password])
    end
 

    respond_to do |format|
      #if @account.update_attributes(params[:account])
      if @account.errors[:base].empty? and @account.update_attributes(params[:account])
        flash[:notice] = "Dati di utenze salvate correttamente"
        format.html { redirect_to(@account, :notice => 'Credenziali modificate.') }
        #format.html { render :action => :edit }
        format.xml  { head :ok }
        format.json { render :json => @account.to_json, :status => 200 }
      else
        #format.html { render :action => "edit" }
        format.html { render :action => :edit, :status => :unprocessable_entity }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
        format.json { render :text => "Non &egrave; stato possibile modificare le credenziali", :status => :unprocessable_entity } #placeholder
      end
    end
  end
 
#  rescue ActiveRecord::RecordNotFound
#    respond_to_not_found(:js, :xml, :html)
#  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    reroute() unless current_account.is? :admin
    
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end


  private

    def reroute()
      flash[:notice] = "Solamente un amministratore pu&ograve; eliminare. (pi&ugrave; lo staff di FiscoSport)"
      redirect_to(accounts_path)
    end

end
