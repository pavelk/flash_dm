class ShoppingsController < ApplicationController
  # GET /shoppings
  # GET /shoppings.xml
  def index
    @shoppings = Shopping.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shoppings }
    end
  end

  # GET /shoppings/1
  # GET /shoppings/1.xml
  def show
    @shopping = Shopping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shopping }
    end
  end

  # GET /shoppings/new
  # GET /shoppings/new.xml
  def new
    @shopping = Shopping.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shopping }
    end
  end

  # GET /shoppings/1/edit
  def edit
    @shopping = Shopping.find(params[:id])
  end

  # POST /shoppings
  # POST /shoppings.xml
  def create
    @shopping = Shopping.new(params[:shopping])

    respond_to do |format|
      if @shopping.save
        flash[:notice] = 'Shopping was successfully created.'
        format.html { redirect_to(@shopping) }
        format.xml  { render :xml => @shopping, :status => :created, :location => @shopping }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shopping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shoppings/1
  # PUT /shoppings/1.xml
  def update
    @shopping = Shopping.find(params[:id])

    respond_to do |format|
      if @shopping.update_attributes(params[:shopping])
        flash[:notice] = 'Shopping was successfully updated.'
        format.html { redirect_to(@shopping) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shopping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppings/1
  # DELETE /shoppings/1.xml
  def destroy
    @shopping = Shopping.find(params[:id])
    @shopping.destroy

    respond_to do |format|
      format.html { redirect_to(shoppings_url) }
      format.xml  { head :ok }
    end
  end
end
