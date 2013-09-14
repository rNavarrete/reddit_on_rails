class PagesController < ApplicationController
  def index
  	@link = Link.all
  end
end

