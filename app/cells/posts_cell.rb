class PostsCell < Cell::Rails

  def recent
    @posts = Post.published.limit(3)

    render
  end

end
