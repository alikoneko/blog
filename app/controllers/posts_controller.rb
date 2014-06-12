class PostsController < ApplicationController
  decorates_assigned :post, :posts

  def index
    @posts = Post.published
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.published.find(params[:id])
  end

  def archive
    @posts = Post.published
  end

  def tags
    @tags = Post.published.tag_counts_on(:tags)
  end
end
