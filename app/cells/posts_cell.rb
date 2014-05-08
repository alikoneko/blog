class PostsCell < Cell::Base

  def recent
    @posts = Post.recent
    render
  end

end
