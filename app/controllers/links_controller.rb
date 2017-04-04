class LinksController < ApplicationController

  def index
    if !current_user
      redirect_to login_path
    else
      @links = current_user.links
      @link = Link.new
    end
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:success] = "#{@link.title} added!"
      redirect_to '/'
    else
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end


end
