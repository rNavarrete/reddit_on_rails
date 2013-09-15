class PagesController < ApplicationController
  def index
  	@link = Link.paginate :page => params[:page], :order => 'updated_at DESC'
  end
end