class ContentsController < ApplicationController
  #devise
  before_filter :authenticate_account!, :except => [:show, :index]

  #only Requiring the right user to change own contents
  before_filter :correct_user, :only => [:edit, :update, :delete, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all

    respond_to do |format|
      format.html # _index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    reroute() unless current_account.is? :admin
    
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end



  private

    def correct_user
      #TODO: field content.account_id does not exist
      return signed_in_and_collaboratore?
      @content = Content.find(params[:id])
      @account = Account.find(@content.account_id)  
      #reroute() unless current_account?(@account) or signed_in_and_master?
      reroute() unless current_account?(@account) or signed_in_and_collaboratore?
    end

    def reroute()
      flash[:notice] = "Solamente la persona che ha creato pu&ograve; modificare od eliminare. (pi&ugrave; lo staff di FiscoSport)"
      redirect_to(contents_path)
    end

end
