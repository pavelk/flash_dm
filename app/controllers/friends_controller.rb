class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.xml
  def index
    @friends = Friend.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.xml
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.xml
  def new
    @friend = Friend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.xml
  def create
    friend = { :recipient_mail => params[:recipient_mail], 
             :sender_mail => params[:sender_mail], 
             :sender_name => params[:sender_name], 
             :message => params[:message],
             :gallery_link => params[:link]
              }
    @friend = Friend.new(friend)

    respond_to do |format|
      if @friend.save
        @friend.deliver_send_to_friend
        format.xml  { render :xml => @friend.to_xml(:status => :created, :location => @friend ) }
      else
        format.xml  { render :xml => @friend.errors }
      end
    end
=begin
    @friend = Friend.new(params[:friend])

    respond_to do |format|
      if @friend.save
        flash[:notice] = 'Friend was successfully created.'
        format.html { redirect_to(@friend) }
        format.xml  { render :xml => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
=end    
  end

  # PUT /friends/1
  # PUT /friends/1.xml
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        flash[:notice] = 'Friend was successfully updated.'
        format.html { redirect_to(@friend) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

end
