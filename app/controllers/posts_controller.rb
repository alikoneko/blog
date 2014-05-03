class PostsController < ApplicationController
  decorates_assigned :post, :posts

  def index
    @posts = Post.published
  end
end