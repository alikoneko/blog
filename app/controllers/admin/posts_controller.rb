module Admin
  class PostsController < ApplicationController

    decorates_assigned :post, :posts

    def index
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
    end

  end
end