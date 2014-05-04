module Admin
  class PostsController < ApplicationController
    decorates_assigned :post, :posts

    def index
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        flash[:notice] = "Post submitted"
        redirect_to [:admin,@post]
      else
        render :new
      end
    end

    private
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end