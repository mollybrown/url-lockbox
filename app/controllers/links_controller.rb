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
    @links = current_user.links
    @link.user_id = current_user.id
    if @link.save
      # render partial: 'links/link', locals: {link: @link, links: @links}
      flash[:success] = "#{@link.title} added!"
      redirect_to '/'
    else
      render :index
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      flash[:success] = "#{@link.title} successfully updated!"
      redirect_to '/'
    else
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end


end
