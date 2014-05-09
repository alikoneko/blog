module Admin
  class PostsController < Admin::ApplicationController
    decorates_assigned :post, :posts

    def index
      if params[:show_all].present?
        @posts = Post.all
      else
        @posts = Post.current
      end

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
      params.require(:post).permit(:title, :body, :status, :tag_list)
    end
  end
end