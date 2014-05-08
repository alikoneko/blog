class PostsCell < Cell::Base

  def recent
    @posts = Post.published.limit(3)

    render
  end

end
