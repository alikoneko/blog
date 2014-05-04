class PostsController < ApplicationController
  decorates_assigned :post, :posts

  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
  end
end