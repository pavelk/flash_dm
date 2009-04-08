class Admin::NotesController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    if(params[:pagingSelector] == nil)
      params[:pagingSelector] = 50
    end
    @notes = Note.all.paginate :page => params[:page], :per_page => params[:pagingSelector]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @notes }
    end
  end
  
end