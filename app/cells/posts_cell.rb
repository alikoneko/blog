class PostsCell < Cell::Rails

  def recent
    @posts = Post.published.limit(3)
    render
  end

  def tag_cloud
    @tags = Post.published.tag_counts_on(:tags).limit(50)
    render
  end

end

#TODO make tags page