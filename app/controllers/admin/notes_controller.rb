class Admin::NotesController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    @notes = Note.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @notes }
    end
  end
  
end