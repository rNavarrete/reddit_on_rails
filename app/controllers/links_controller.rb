class LinksController < ApplicationController
  def show
    @link    = Link.find(params[:id])
    @comment = Comment.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_url,
          notice: "Link successfully submitted." }
        format.json { render json: @link,
          status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors,
          notice: "Link successfully submitted." }
      end
    end


  end
end