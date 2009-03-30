class UsersController < ApplicationController

  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def get_code
    @code = Code.find_by_code(params[:code])
    
    if(@code != nil)
      render :text => @code.to_xml, :status => 200
    else
      render :text => 'no', :status => 200
    end
  end
  
  def update_status
    @user = User.find(params[:id])
    
    @user.code = true
    if @user.save 
  
    respond_to do |format|
      #format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  end
      
  def create
    user = { :login => params[:login], 
             :email => params[:email], 
             :password => params[:password], 
             :password_confirmation => params[:password_confirmation],
             :family_name => params[:family_name],
             :city => params[:city],
             :first_name => params[:first_name],
             :last_name => params[:last_name],
             :street => params[:street]
              }
    @user = User.new(user)
    
    respond_to do |format|
      if @user.save
        @user.deliver_registration_mail
        format.xml  { render :xml => @user.to_xml(:only => [ :login, :email, :first_name, :last_name ]), :status => :created, :location => @user }
      else
        format.xml  { render :xml => @user.errors }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
