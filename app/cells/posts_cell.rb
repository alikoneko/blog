class PostsCell < Cell::Base

  def recent
    @posts = Posts.recent
    render
  end

end
