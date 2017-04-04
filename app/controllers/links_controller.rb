class LinksController < ApplicationController

  def index
    if !current_user
      redirect_to login_path
    else
      @links = Link.all
      @user = current_user
    end
  end

end
