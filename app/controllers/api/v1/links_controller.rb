class Api::V1::LinksController < ApplicationController

  def hot_reads
    @links = Link.top_ten_links
    render json: @links
  end

  def create
    # byebug
    # @link = current_user.links.new(link_params)
    @link = current_user.links.new(url: params["link"]["url"],
                                   title: params["link"]["title"],
                                   user_id: current_user.id,
                                   read_count: 0)
    if @link.save
      render partial: "links/link", locals: {link: @link}, layout: false
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    # byebug
    @link = Link.find(params[:id])
    if @link.update_attributes(read: params["read"])
      @link.update(read_count: @link.read_count += 1)
      render json: @link, status: 200
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  # private
  #
  # def link_params
  #   params.permit(:link, :url, :title)
  # end
end
