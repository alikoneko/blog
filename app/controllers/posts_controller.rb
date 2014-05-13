class PostsController < ApplicationController
  decorates_assigned :post, :posts

  def index
    if params[:tag]
      @posts =  Post.published.tagged_with(params[:tag]).page params[:page]
    else
      @posts = Post.published.page params[:page]
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def archive
    @posts = Post.published.page params[:page]
  end
end
