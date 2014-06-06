class PostsController < ApplicationController
  decorates_assigned :post, :posts

  def index
    @posts = Post.published
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def archive
    @posts = Post.published
  end
end
