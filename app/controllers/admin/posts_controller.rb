module Admin
  class PostsController < ApplicationController
    decorates_assigned :post, :posts

    def index
      @posts = Post.current
    end

    def show
      @post = Post.find(params[:id])
    end

    def show_all
      @post = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        flash[:notice] = "Post submitted"
        redirect_to [:admin, @post]
      else
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update_attributes post_params
        flash[:notice] = "Post edited"
        redirect_to [:admin, @post]
      else
        render :edit
      end

    end

    private
    def post_params
      params.require(:post).permit(:title, :body, :status)
    end
  end
end