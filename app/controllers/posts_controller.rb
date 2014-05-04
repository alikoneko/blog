class PostsController < ApplicationController
  decorates_assigned :post, :posts

  def index
    @posts = Post.published.page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end
end